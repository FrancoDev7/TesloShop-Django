# Generated by Django 4.2.4 on 2023-11-25 01:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teslo_shop', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='producto',
            name='stock',
            field=models.IntegerField(default=0, verbose_name='Stock del producto'),
        ),
    ]
