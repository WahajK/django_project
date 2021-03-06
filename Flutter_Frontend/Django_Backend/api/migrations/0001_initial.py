# Generated by Django 3.2.9 on 2021-12-18 12:19

import api.models
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='payment',
            fields=[
                ('payment_id', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('total', models.FloatField()),
                ('method', models.TextField()),
                ('status', models.TextField(choices=[('paid', 'PAID'), ('unpaid', 'UNPAID')], default='unpaid')),
            ],
        ),
        migrations.CreateModel(
            name='user',
            fields=[
                ('username', models.TextField(primary_key=True, serialize=False, unique=True)),
                ('email', models.TextField(unique=True)),
                ('fname', models.TextField()),
                ('contact', models.TextField()),
                ('address', models.TextField()),
                ('password', models.TextField()),
                ('image', models.ImageField(blank=True, default='media/default.jpg', null=True, upload_to=api.models.upload_to)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='worker',
            fields=[
                ('username', models.TextField(primary_key=True, serialize=False, unique=True)),
                ('email', models.TextField(unique=True)),
                ('fname', models.TextField()),
                ('contact', models.TextField()),
                ('category', models.CharField(choices=[('engineer', 'ENGINEER'), ('plumber', 'PLUMBER'), ('doctor', 'DOCTOR'), ('carpenter', 'CARPENTER'), ('electrician', 'ELECTRICIAN'), ('painter', 'PAINTER'), ('barber', 'BARBER'), ('house constructor', 'HOUSE CONSTRUCTOR'), ('mason', 'MASON'), ('gardener', 'GARDENER'), ('cctv installation', 'CCTV INSTALLATION'), ('roofing & ceiling', 'ROOFING & CEILING'), ('welder', 'WELDER'), ('tailor', 'TAILOR'), ('ac/geyser installation', 'AC/GEYSER INSTALLATION'), ('mobile repair', 'MOBILE REPAIR'), ('maid', 'MAID')], max_length=255)),
                ('password', models.TextField()),
                ('image', models.ImageField(blank=True, default='media/default.jpg', null=True, upload_to=api.models.upload_to)),
                ('rating', models.FloatField(default=0.0, validators=[django.core.validators.MinValueValidator(0.0), django.core.validators.MaxValueValidator(5.0)])),
                ('address', models.TextField()),
                ('updated', models.DateTimeField(auto_now=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='recent',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('context', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.worker')),
                ('u_username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.user')),
            ],
        ),
        migrations.CreateModel(
            name='feedback',
            fields=[
                ('feedback_id', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('rating', models.FloatField(validators=[django.core.validators.MinValueValidator(0.0), django.core.validators.MaxValueValidator(5.0)])),
                ('comments', models.TextField()),
                ('u_username', models.ForeignKey(default=django.db.models.deletion.SET_NULL, on_delete=django.db.models.deletion.CASCADE, to='api.user')),
                ('w_username', models.ForeignKey(default=django.db.models.deletion.SET_NULL, on_delete=django.db.models.deletion.CASCADE, to='api.worker')),
            ],
        ),
        migrations.CreateModel(
            name='appointment',
            fields=[
                ('appointment_id', models.AutoField(auto_created=True, default=1, primary_key=True, serialize=False)),
                ('category', models.CharField(choices=[('engineer', 'ENGINEER'), ('plumber', 'PLUMBER'), ('doctor', 'DOCTOR'), ('carpenter', 'CARPENTER'), ('electrician', 'ELECTRICIAN'), ('painter', 'PAINTER'), ('barber', 'BARBER'), ('house constructor', 'HOUSE CONSTRUCTOR'), ('mason', 'MASON'), ('gardener', 'GARDENER'), ('cctv installation', 'CCTV INSTALLATION'), ('roofing & ceiling', 'ROOFING & CEILING'), ('welder', 'WELDER'), ('tailor', 'TAILOR'), ('ac/geyser installation', 'AC/GEYSER INSTALLATION'), ('mobile repair', 'MOBILE REPAIR'), ('maid', 'MAID')], max_length=255)),
                ('timing', models.TimeField()),
                ('status', models.TextField(choices=[('rejected', 'REJECTED'), ('completed', 'COMPLETED'), ('pending', 'PENDING'), ('on going', 'ON GOING'), ('on hold', 'ON HOLD')])),
                ('description', models.TextField()),
                ('start_date', models.DateTimeField()),
                ('updated', models.DateTimeField(auto_now=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('payment_status', models.ForeignKey(default='pending', on_delete=django.db.models.deletion.CASCADE, to='api.payment')),
                ('u_username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.user')),
                ('w_username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.worker')),
            ],
        ),
    ]
