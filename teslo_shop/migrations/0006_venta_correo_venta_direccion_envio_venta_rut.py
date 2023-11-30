# Generated by Django 4.2.4 on 2023-11-27 19:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teslo_shop', '0005_venta'),
    ]

    operations = [
        migrations.AddField(
            model_name='venta',
            name='correo',
            field=models.EmailField(max_length=254, null=True, verbose_name='Correo de contacto'),
        ),
        migrations.AddField(
            model_name='venta',
            name='direccion_envio',
            field=models.CharField(max_length=255, null=True, verbose_name='Dirección de envío'),
        ),
        migrations.AddField(
            model_name='venta',
            name='rut',
            field=models.CharField(max_length=12, null=True, verbose_name='RUT'),
        ),
    ]