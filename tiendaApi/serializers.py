from rest_framework import serializers
from teslo_shop.models import Producto

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ['id', 'nombre', 'descripcion', 'precio', 'talla', 'stock', 'imagen']

        