from django.db import models
from django.db.models.fields.reverse_related import ManyToOneRel
from django.dispatch import receiver
from django.urls import reverse
from django_rest_passwordreset.signals import reset_password_token_created
from django.core.mail import send_mail 
from django.core.validators import MaxValueValidator, MinValueValidator
import datetime
import os

# Create your models here.
def upload_to(instance, filename):
    return 'user/{filename}'.format(filename=filename)

CATEGORY_CHOICES = (
    ('engineer','ENGINEER'),
    ('plumber', 'PLUMBER'),
    ('doctor','DOCTOR'),
    ('carpenter','CARPENTER'),
    ('electrician','ELECTRICIAN'),
    ('painter','PAINTER'),
    ('barber','BARBER'),
    ('house constructor','HOUSE CONSTRUCTOR'),
    ('mason','MASON'),
    ('gardener','GARDENER'),
    ('cctv installation','CCTV INSTALLATION'),
    ('roofing & ceiling','ROOFING & CEILING'),
    ('welder','WELDER'),
    ('tailor','TAILOR'),
    ('ac/geyser installation','AC/GEYSER INSTALLATION'),
    ('mobile repair','MOBILE REPAIR'),
    ('maid','MAID'),
)
class user(models.Model):
    username = models.TextField(unique=True,primary_key=True)
    email = models.TextField(unique=True,null=False)
    fname = models.TextField(null=False)
    lname = models.TextField()
    contact = models.TextField(null=False)
    address = models.TextField()
    password = models.TextField(null=False)
    image = models.ImageField(upload_to=upload_to,null=True,blank=True,default='media/default.jpg')
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    # user_id = models.AutoField(auto_created=True,primary_key=True)


class worker(models.Model):
    username = models.TextField(unique=True,primary_key=True)
    email = models.TextField(unique=True,null=False)
    fname = models.TextField(null=False)
    lname = models.TextField()
    contact = models.TextField(null=False)
    category = models.CharField(choices=CATEGORY_CHOICES,null=False,max_length=255)
    password = models.TextField(null=False)
    image = models.ImageField(upload_to=upload_to,null=True,blank=True,default='media/default.jpg')
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    # worker_id = models.AutoField(auto_created=True,primary_key=True)
    # feedback = models.ForeignKey(feedback)
    # average_rates = models.FloatField()

class appointment(models.Model):
    category = models.CharField(choices=CATEGORY_CHOICES,null=False,max_length=255)
    u_username = models.ForeignKey(user, on_delete=models.CASCADE)
    w_username = models.ForeignKey(worker, on_delete=models.CASCADE)
    appointment_id = models.AutoField(auto_created=True,primary_key=True,default=1)
    timing = models.TimeField()
    status = models.BooleanField() #Change to options
    description = models.TextField(null=False)
    start_date = models.DateTimeField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    
class payment(models.Model):
    total = models.FloatField(null=False) 
    method = models.TextField(null=False)
    payment_id = models.AutoField(auto_created=True,primary_key=True,default=1)
    
class service(models.Model):
    service_id = models.AutoField(primary_key=True,auto_created=True,default=1) 
    name = models.TextField(null=False)

class feedback(models.Model):
    feedback_id = models.AutoField(primary_key=True,auto_created=True,default=1) 
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)])
    comments = models.TextField()

    def __str__(self):
        return self.username[0:50]
    

    # class Meta:
    #     ordering = ['-updated']

@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):
    email_plaintext_message = "{}?token={}".format(reverse('password_reset:reset-password-request'), reset_password_token.key)

    send_mail(
        # title:
        "Password Reset for {title}".format(title="Some website title"),
        # message:
        email_plaintext_message,
        # from:
        "noreply@somehost.local",
        # to:
        [reset_password_token.user.email]
    )