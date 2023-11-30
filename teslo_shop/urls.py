from django.urls import path
from django.conf import settings
from .views import *


urlpatterns = [

    path('',ProductosView , name='home'),
    #Productos
    path('productos/',ProductosListView , name='productos'),
    path('crear_producto/', crear_producto, name='crear_producto'),
    path('editar_producto/<int:producto_id>/', editar_producto, name='editar_producto'),
    path('eliminar_producto/<int:producto_id>/', eliminar_producto, name='eliminar_producto'),
    
    #Usuarios
    path('usuarios/',UsuariosListView , name='usuarios'),
    path('agregar_usuario/', agregar_usuario, name='agregar_usuario'),
    path('editar_usuario/<int:usuario_id>/', editar_usuario, name='editar_usuario'),
    path('eliminar_usuario/<int:usuario_id>/', eliminar_usuario, name='eliminar_usuario'),

    #Ventas
    path('ventas/',VentasListView , name='ventas'),
    path('formulario_venta/<int:producto_id>/', formulario_venta, name='formulario_venta'),
    path('agregar_venta/', crear_venta, name='agregar_venta'),
    path('editar_venta/<int:venta_id>/', editar_venta, name='editar_venta'),
    path('eliminar_venta/<int:venta_id>/', eliminar_venta, name='eliminar_venta'),

    #Admin
    path('mantenedores/',mantenedores , name='mantenedores'),
    
]

if settings.DEBUG:
    from django.conf.urls.static import static
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)