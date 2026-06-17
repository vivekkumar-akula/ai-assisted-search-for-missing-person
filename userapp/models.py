from django.db import models
from io import BytesIO
from django.core.files import File
# from PIL import Image
import os

#create your models here:
class usermodel(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    father = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    dob = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    photo = models.ImageField(upload_to="images/", null=True)
    
    class Meta:
        db_table = 'user_registrations'
        
class registercasemodel(models.Model):
    case_id = models.AutoField(primary_key=True)
    user_case = models.ForeignKey(usermodel,on_delete=models.CASCADE,null=True)
    name = models.CharField(max_length=50,null=True)
    mobile = models.CharField(max_length=50,null=True)
    email = models.EmailField(null=True)
    description = models.CharField(max_length=50,null=True)
    photo = models.ImageField(null=True)
    status = models.CharField(max_length=50,default='Not Found')
    
    class Meta:
        db_table = 'register_case'

class userfeedback(models.Model):
    feedback_id = models.AutoField(primary_key=True)
    feedback2 = models.ForeignKey(usermodel,on_delete=models.CASCADE)
    overall = models.IntegerField(help_text='data',null=True)
    caseregister = models.IntegerField(help_text='responding',null=True)
    suggestion = models.CharField(help_text='suggestion',max_length=400,null=True)
    sentiment = models.CharField(help_text='sentiment',null=True,max_length=50)
    
    class Meta:
        db_table = "userfeedback_details"