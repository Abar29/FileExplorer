# Generated by Django 5.0.3 on 2025-02-24 02:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('FileExp', '0004_alter_file_file_folder_file_folder'),
    ]

    operations = [
        migrations.AddField(
            model_name='folder',
            name='is_archived',
            field=models.BooleanField(default=False),
        ),
    ]
