from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from .models import Category, File, Folder
from .forms import FileUploadForm
from django.http import JsonResponse
import os



def unarchive_category(request, category_id):
    """Restore an archived category."""
    if request.method == "POST":
        category = get_object_or_404(Category, id=category_id, is_archived = True)
        category.is_archived = False
        category.save()
        return JsonResponse({"message": "File restored successfully!", "category_id": category_id})

    return JsonResponse({"error": "Invalid request method."}, status=400)



def edit_folder(request, folder_id):
    """Edit folder name via GET request."""
    folder = get_object_or_404(Folder, id=folder_id)
    
    new_name = request.GET.get("new_name", "").strip()
    if not new_name:
        return JsonResponse({"error": "Folder name is required."}, status=400)

    folder.name = new_name
    folder.save()

    return JsonResponse({"success": True, "message": "Folder updated successfully!"})


def category_list(request):
    """List all categories and allow adding a new category."""
    if request.method == 'POST':
        new_category_name = request.POST.get('category_name')
        if new_category_name:
            Category.objects.create(name=new_category_name)
            messages.success(request, "Category added successfully!")
            return redirect('category_list')

    categories = Category.objects.filter(is_archived = False)
    return render(request, "category_list.html", {"categories": categories})

def edit_category(request):
    """Edit an existing category."""
    if request.method == "POST":
        category_id = request.POST.get("category_id")
        new_name = request.POST.get("category_name")

        if category_id and new_name:
            category = get_object_or_404(Category, id=category_id)
            category.name = new_name
            category.save()
            messages.success(request, "Category updated successfully!")

    return redirect("category_list")

def delete_category(request):
    """Delete a category and its associated files & folders."""
    if request.method == "POST":
        category_id = request.POST.get("category_id")

        if category_id:
            category = get_object_or_404(Category, id=category_id)
            category.is_archived=True
            category.save()
            # category.folders.all().delete()  # Delete folders
            # category.files.all().delete()  # Delete files
            # category.delete()
            messages.success(request, "Category and its contents deleted successfully!")

    return redirect("category_list")

def upload_file(request, category_id):
    """Upload a file into a category."""
    category = get_object_or_404(Category, id=category_id)
    folders = category.folders.filter(parent__isnull=True,is_archived=False)  # Fetch top-level folders
    files = category.files.filter(folder__isnull=True,is_archived=False)  # Fetch files not in any folder

    if request.method == "POST":
        form = FileUploadForm(request.POST, request.FILES)
        if form.is_valid():
            file = form.save(commit=False)
            file.category = category
            file.save()
            messages.success(request, "File uploaded successfully!")
            return redirect('upload_file', category_id=category.id)
    else:
        form = FileUploadForm()

    return render(request, "upload_file.html", {"category": category, "folders": folders, "files": files, "form": form})

def view_file(request, file_id):
    """View a specific file."""
    file = get_object_or_404(File, id=file_id)
    return render(request, 'view_file.html', {'file': file})

def create_folder(request, category_id):
    """Create a new folder in a category."""
    category = get_object_or_404(Category, id=category_id)
    if request.method == 'POST':
        folder_name = request.POST.get('folder_name')
        if folder_name:
            Folder.objects.create(name=folder_name, category=category)
            messages.success(request, "Folder created successfully!")
            return redirect('upload_file', category_id=category.id)
    return redirect('upload_file', category_id=category.id)

def folder_detail(request, folder_id):
    """View details of a specific folder."""
    folder = get_object_or_404(Folder, id=folder_id)
    subfolders = folder.subfolders.filter(is_archived=False)
    files = folder.files.filter(is_archived=False)
    return render(request, "folder_detail.html", {"folder": folder, "subfolders": subfolders, "files": files})

def upload_file_to_folder(request, folder_id):
    """Upload a file into a specific folder with validation."""
    folder = get_object_or_404(Folder, id=folder_id)

    if request.method == "POST" and request.FILES.get("file"):
        uploaded_file = request.FILES["file"]

        # File type validation
        allowed_extensions = [".pdf", ".docx", ".jpg", ".png"]
        ext = os.path.splitext(uploaded_file.name)[1].lower()
        if ext not in allowed_extensions:
            messages.error(request, "Invalid file type. Only PDF, DOCX, JPG, PNG allowed.")
            return redirect("folder_detail", folder_id=folder.id)

        # File size validation (e.g., max 5MB)
        max_size = 5 * 1024 * 1024  # 5MB
        if uploaded_file.size > max_size:
            messages.error(request, "File too large. Maximum size is 5MB.")
            return redirect("folder_detail", folder_id=folder.id)

        # Save file after validation
        File.objects.create(folder=folder, file=uploaded_file, category=folder.category)
        messages.success(request, "File uploaded successfully!")

    return redirect("folder_detail", folder_id=folder.id)

def archive_folder(request, folder_id):
    """Archive a folder instead of deleting it."""
    if request.method == "POST":
        folder = get_object_or_404(Folder, id=folder_id)
        folder.is_archived = True
        folder.save()
        return redirect('upload_file', category_id=folder.category.id)
    return HttpResponse("Invalid request", status=400)

    # folder = get_object_or_404(Folder, id=folder_id)
    # folder.is_archived = True
    # folder.save()
    # messages.success(request, "Folder archived successfully!")
    # return redirect("upload_file", category_id=folder.category.id)


    # def delete_category(request):
    # """Delete a category and its associated files & folders."""
    # if request.method == "POST":
    #     category_id = request.POST.get("category_id")

    #     if category_id:
    #         category = get_object_or_404(Category, id=category_id)
    #         category.is_archived=True
    #         category.save()
    #         # category.folders.all().delete()  # Delete folders
    #         # category.files.all().delete()  # Delete files
    #         # category.delete()
    #         messages.success(request, "Category and its contents deleted successfully!")

    # return redirect("category_list")


def unarchive_folder(request, folder_id):
    """Restore an archived folder."""
    if request.method == "POST":
        folder = get_object_or_404(Folder, id=folder_id, is_archived=True)
        folder.is_archived = False
        folder.save()
        return JsonResponse({"message": "File restored successfully!", "folder_id": folder_id})
    
    return JsonResponse({"error": "Invalid request method."}, status=400)



def archive_file(request, file_id):
    """Archive a file instead of deleting it."""
    file = get_object_or_404(File, id=file_id)
    file.is_archived = True
    file.save()
    return redirect('upload_file', category_id=file.category.id)  # Fixed line

    return HttpResponse("Invalid request", status=400)  # This will never be reached


def archived_items(request):
    """View all archived files and folders."""
    archived_folders = Folder.objects.filter(is_archived=True)
    archived_files = File.objects.filter(is_archived=True)

    return render(request, "archived_categories.html", {
        "archived_folders": archived_folders,
        "archived_files": archived_files
    })


def unarchive_file(request, file_id):
    """Restore an archived file."""
    if request.method == "POST":
        file = get_object_or_404(File, id=file_id, is_archived=True)
        file.is_archived = False
        file.save()
        return JsonResponse({"message": "File restored successfully!", "file_id": file_id})
    return JsonResponse({"error": "Invalid request method."}, status=400)


def archived_categories(request):
    """View all archived categories, folders, and files."""
    archived_categories = Category.objects.filter(is_archived=True)
    archived_folders = Folder.objects.filter(is_archived=True)
    archived_files = File.objects.filter(is_archived=True)

    return render(request, "archived_categories.html", {
        "archived_categories": archived_categories,
        "archived_folders": archived_folders,
        "archived_files": archived_files
    })