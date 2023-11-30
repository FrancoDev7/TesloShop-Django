import os
from django.db import models
from django.contrib.auth.models import User
from .tallas import tallas
from django.utils.crypto import get_random_string


# Create your models here.

class Producto(models.Model):
    nombre = models.CharField(max_length=50 , verbose_name='Nombre del producto')
    descripcion = models.CharField(max_length=200, verbose_name='Descripción del producto')
    precio = models.IntegerField( verbose_name='Precio del producto')
    talla = models.CharField(max_length=2, choices=tallas, verbose_name='Talla del producto')
    stock = models.IntegerField( default=0, verbose_name='Stock del producto')
    
    imagen = models.ImageField(upload_to='Productos/', null=True,blank=True, verbose_name='Imagen del producto')
       
    class Meta:
        db_table = 'Producto'
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'

    def __str__(self):
        return self.nombre
    
class Venta(models.Model):
    codigo = models.CharField(max_length=10, unique=True, verbose_name='Código de venta')
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(verbose_name='Cantidad')
    nombre_comprador = models.CharField(max_length=100, verbose_name='Nombre del comprador')
    fecha_venta = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de venta')
    correo = models.EmailField(verbose_name='Correo de contacto',null=True)
    direccion_envio = models.CharField(max_length=255, verbose_name='Dirección de envío',null=True)
    rut = models.CharField(max_length=12, verbose_name='RUT',null=True)

    def save(self, *args, **kwargs):
        if not self.codigo:
            self.codigo = get_random_string(length=8)  # Generar código aleatorio si no se proporciona uno
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Venta {self.codigo} - {self.nombre_comprador}"