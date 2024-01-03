# Generated by Django 5.0 on 2023-12-23 21:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appflotavehicular', '0004_mantenimiento'),
    ]

    operations = [
        migrations.CreateModel(
            name='Rango',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rangopersona', models.CharField(max_length=100)),
                ('detalle', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name': 'Rango',
                'verbose_name_plural': 'Rangos',
            },
        ),
    ]
