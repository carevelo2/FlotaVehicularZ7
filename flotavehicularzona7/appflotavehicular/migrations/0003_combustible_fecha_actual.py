# Generated by Django 4.2.8 on 2024-02-18 02:08

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('appflotavehicular', '0002_combustible'),
    ]

    operations = [
        migrations.AddField(
            model_name='combustible',
            name='fecha_actual',
            field=models.DateField(blank=True, default=django.utils.timezone.now, null=True),
        ),
    ]
