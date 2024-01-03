# Generated by Django 5.0 on 2023-12-19 22:37

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Persona',
            fields=[
                ('identificacion', models.CharField(max_length=10, primary_key=True, serialize=False, unique=True)),
                ('nombres', models.CharField(max_length=50)),
                ('apellidos', models.CharField(max_length=50)),
                ('contraseña', models.CharField(max_length=10)),
                ('direccion', models.CharField(max_length=150)),
                ('tipo_sangre', models.CharField(max_length=10)),
                ('ciudad_nacimiento', models.CharField(max_length=25)),
                ('numero_celular', models.CharField(max_length=10)),
                ('dependencia', models.CharField(max_length=150)),
            ],
            options={
                'verbose_name': 'Persona',
                'verbose_name_plural': 'Personas',
            },
        ),
        migrations.CreateModel(
            name='Tipovehiculo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipovehiculo', models.CharField(max_length=100)),
                ('descripcion', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'Tipo Vehículo',
                'verbose_name_plural': 'Tipos de Vehículos',
            },
        ),
        migrations.CreateModel(
            name='Vehiculo',
            fields=[
                ('placa', models.CharField(max_length=8, primary_key=True, serialize=False)),
                ('chasis', models.CharField(max_length=30)),
                ('marca', models.CharField(max_length=30)),
                ('modelo', models.CharField(max_length=40)),
                ('color', models.CharField(max_length=20)),
                ('motor', models.CharField(max_length=100)),
                ('kilometraje', models.IntegerField()),
                ('cilindraje', models.FloatField()),
                ('capacidad_carga', models.IntegerField()),
                ('capacidad_pasajeros', models.IntegerField()),
                ('tipovehiculo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.tipovehiculo')),
            ],
            options={
                'verbose_name': 'Vehículo',
                'verbose_name_plural': 'Vehículos',
            },
        ),
    ]
