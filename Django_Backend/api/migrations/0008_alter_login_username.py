# Generated by Django 3.2.9 on 2021-11-08 19:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_auto_20211106_2146'),
    ]

    operations = [
        migrations.AlterField(
            model_name='login',
            name='username',
            field=models.TextField(unique=True),
        ),
    ]