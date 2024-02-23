# Generated by Django 5.0 on 2024-02-23 13:03

import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appflotavehicular', '0003_combustible_fecha_actual'),
    ]

    operations = [
        migrations.CreateModel(
            name='Pertrechos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipoarma', models.CharField(max_length=50)),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.CharField(max_length=200)),
                ('codigo', models.CharField(max_length=10, unique=True)),
                ('dependencia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.dependencia')),
            ],
            options={
                'verbose_name': 'Pertrechos',
                'verbose_name_plural': 'Pertrechos',
            },
        ),
        migrations.CreateModel(
            name='Armaperpol',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecharegistro', models.DateField(default=django.utils.timezone.now)),
                ('horaregistro', models.TimeField()),
                ('policia', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.persona')),
                ('pertrecho', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appflotavehicular.pertrechos')),
            ],
            options={
                'verbose_name': 'Asignación de arma a policía',
                'verbose_name_plural': 'Asignaciones de armas a policías',
            },
        ),
    ]