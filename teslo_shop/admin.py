from django.contrib import admin
from .models import *
# Register your models here.

class ProductoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'precio','stock', 'talla', 'imagen')
    search_fields = ('nombre', 'descripcion', 'precio','stock', 'talla', 'imagen')
    list_filter = ('nombre', 'descripcion', 'precio', 'talla', 'imagen')


admin.site.register(Producto, ProductoAdmin)

class VentaAdmin(admin.ModelAdmin):
    list_display = ('codigo', 'producto', 'cantidad', 'nombre_comprador', 'correo', 'fecha_venta') 
    search_fields = ('codigo', 'nombre_comprador', 'correo')  
    list_filter = ('producto', 'fecha_venta')

admin.site.register(Venta, VentaAdmin)
