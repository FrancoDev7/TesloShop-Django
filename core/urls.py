
from django.contrib import admin
from django.urls import path, include
from tiendaApi import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('teslo_shop.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    
    #api
    path('productosapi/', views.ProductoApis, name='productosapi'),
    path('productosListApi/',views.ProductoApi, name='productosApi'),
    path('productosDetailApi/<int:pk>/', views.ProductoApiDetail, name='productosapidetail'),
]
