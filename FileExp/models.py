from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=255)
    is_archived = models.BooleanField(default=False)

class Folder(models.Model):
    name = models.CharField(max_length=255)
    category = models.ForeignKey(Category, related_name='folders', on_delete=models.CASCADE)
    parent = models.ForeignKey('self', null=True, blank=True, related_name='subfolders', on_delete=models.CASCADE)
    is_archived = models.BooleanField(default=False)  

class File(models.Model):
    category = models.ForeignKey(Category, related_name='files', on_delete=models.CASCADE)
    folder = models.ForeignKey(Folder, related_name='files', null=True, blank=True, on_delete=models.CASCADE)
    file = models.FileField(upload_to='uploads/')
    is_archived = models.BooleanField(default=False) 
