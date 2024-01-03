# Generated by Django 5.0 on 2023-12-28 21:31

import datetime
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appflotavehicular', '0011_alter_mantenimiento_fecha_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mantenimiento',
            name='fecha',
            field=models.DateField(default=datetime.datetime(2023, 12, 28, 16, 31, 11, 181083)),
        ),
        migrations.AlterField(
            model_name='persona',
            name='fecha_nacimiento',
            field=models.DateField(default=datetime.datetime(2023, 12, 28, 16, 31, 11, 179084)),
        ),
        migrations.CreateModel(
            name='Dependencia',
            fields=[
                ('identificacion', models.CharField(max_length=10, primary_key=True, serialize=False, unique=True)),
                ('provincia', models.CharField(max_length=50)),
                ('parroquia', models.CharField(max_length=50)),
                ('id_circuito', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.circuito')),
                ('id_distrito', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.distrito')),
                ('id_subcircuito', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.subcircuito')),
            ],
            options={
                'verbose_name': 'Dependencia',
                'verbose_name_plural': 'Dependencias',
            },
        ),
    ]
