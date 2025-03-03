from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from FileExp.views import category_list  # Import your category_list view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('files/', include('FileExp.urls')),  # Include the app URLs
    path('', category_list, name='home'),  # Add this line for homepage
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)