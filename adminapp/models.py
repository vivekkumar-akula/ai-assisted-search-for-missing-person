from django.db import models

# Create your models here.
class addcasemodel(models.Model):
    add_id = models.AutoField(primary_key=True)
    Child = models.CharField(max_length=50)
    father = models.CharField(max_length=50)
    address = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=50)
    photo = models.ImageField(upload_to="images/",null=True)
    eyecolor = models.CharField(max_length=50)
    haricolor = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    dob = models.CharField(max_length=50)
    status = models.CharField(max_length=50,default='Not Found')
    
    class Meta:
        db_table = 'add_cases'
        