from django.urls import path
from .views import (
    category_list, upload_file, view_file, edit_category, delete_category, 
    create_folder, folder_detail, upload_file_to_folder, archived_categories, 
    unarchive_category, archive_folder, archive_file, unarchive_folder, 
    unarchive_file, archived_items, edit_folder # Ensure this exists in views.py
)

urlpatterns = [
    path('', category_list, name='category_list'),  
    path('add_category/', category_list, name='add_category'),  
    path('upload/<int:category_id>/', upload_file, name='upload_file'),
    path('folder/<int:folder_id>/upload/', upload_file_to_folder, name='upload_file_to_folder'),
    path('view/<int:file_id>/', view_file, name='view_file'),
    path('edit_category/', edit_category, name='edit_category'),
    path('delete_category/', delete_category, name='delete_category'),
    path('create_folder/<int:category_id>/', create_folder, name='create_folder'),
    path('folder/<int:folder_id>/', folder_detail, name='folder_detail'),
    
    path('archived-categories/', archived_categories, name='archived_categories'),
    path('archived-items/', archived_items, name='archived_items'),  # Fixed duplicate URL
    
    path('unarchive-category/<int:category_id>/', unarchive_category, name='unarchive_category'),
    path('archive_folder/<int:folder_id>/', archive_folder, name='archive_folder'),
    path('archive_file/<int:file_id>/', archive_file, name='archive_file'),
    
    path('unarchive-folder/<int:folder_id>/', unarchive_folder, name='unarchive_folder'),
    path('unarchive-file/<int:file_id>/', unarchive_file, name='unarchive_file'),
    path('edit-folder/<int:folder_id>/', edit_folder, name='edit_folder'),

]
