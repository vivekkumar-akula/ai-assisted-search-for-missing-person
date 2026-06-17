import requests

from django.shortcuts import render,redirect
from django.contrib import messages
from adminapp.models import*
from userapp.models import*

from missing_persons.FaceMatch import detect_face
# Create your views here.
def main_policelogin(request):
    if request.method == "POST":
        name = request.POST.get("name")
        password = request.POST.get("password")
        
        if name == "admin" and password == "admin":
            messages.success(request,"admin login successfully")
            return redirect("admin_dashboard")
        
        else:
            messages.error(request,"invalid admin name and password")
    return render(request,"main/main-policelogin.html")

def admin_addnewcase(request):
    if request.method == "POST" and request.FILES['photo']:
        
        child = request.POST.get("child")
        father = request.POST.get("father")
        address = request.POST.get("address")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        photo = request.FILES['photo']
        eyecolor = request.POST.get("eyecolor")
        haircolor = request.POST.get("haircolor")
        gender = request.POST.get("gender")
        dob = request.POST.get("dob")
        
        try:
            addcasemodel.objects.get(email=email)
            messages.info(request,"email already existed")
            return redirect('admin_addnewcase')
        except:
            addcasemodel.objects.create(
                Child = child,
                father = father,
                address = address,
                email = email,
                phone =phone,
                photo = photo,
                eyecolor =eyecolor,
                haricolor = haircolor,
                gender = gender,
                dob =dob,
            )
            messages.success(request,"Case Have Successfully Added")
    return render(request,"admin/admin-addnewcase.html")

def admin_casesanalysisgraph(request):
    user_cases = registercasemodel.objects.all().count()
    addcases = addcasemodel.objects.all().count()
    found_persons = addcasemodel.objects.filter(status='Found').count()
    not_found_persons = addcasemodel.objects.filter(status='Not Found').count()
    return render(request,"admin/admin-casesanalysisgraph.html",{
        "user_cases":user_cases,
        "addcases":addcases,
        "found_persons":found_persons,
        "not_found_persons":not_found_persons
        })

def admin_dashboard(request):
    user2 = registercasemodel.objects.all().count()
    user3 = addcasemodel.objects.all().count()
    user1 = usermodel.objects.all().count()
    return render(request,"admin/admin-dashboard.html",{"user2":user2,"user3":user3,"user1":user1})

def admin_editmanagecases(request,add_id):
    edit = addcasemodel.objects.get(add_id = add_id)
    if request.method == "POST":
        child = request.POST.get('child')
        father = request.POST.get('father')
        address = request.POST.get('address')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        photo = request.POST.get('photo')
        eyecolor = request.POST.get('eyecolor')
        haricolor = request.POST.get('haricolor')
        gender = request.POST.get('gender')
        dob = request.POST.get('dob')
        
        if len(request.FILES) !=0:
            photo = request.FILES['photo']
            edit.Child = child
            edit.father = father
            edit.address = address
            edit.email = email
            edit.phone = phone
            edit.photo = photo
            edit.eyecolor = eyecolor
            edit.haricolor = haricolor
            edit.gender = gender
            edit.dob = dob
            edit.save()
            
        else:
            edit.Child = child
            edit.father = father
            edit.address = address
            edit.email = email
            edit.phone = phone
            edit.eyecolor = eyecolor
            edit.haricolor = haricolor
            edit.gender = gender
            edit.dob = dob
            edit.save()
        messages.success(request,"successfully updated") 
        return redirect('admin_managecases')   
    return render(request,"admin/admin-editmanagecases.html",{'edit':edit})

def admin_managecases(request):
    manage = addcasemodel.objects.all()
    return render(request,"admin/admin-managecases.html",{"case":manage})

def admin_sentimentgraph(request):
    sentiment = userfeedback.objects.all()
    return render(request,"admin/admin-sentimentgraph.html",{"data":sentiment})

def admin_viewusersubmittedcases(request):
    submitted = registercasemodel.objects.all()
    return render(request,"admin/admin-viewusersubmittedcases.html",{"cases":submitted})


def admin_find_match(request):
    manage = addcasemodel.objects.filter(status='Not Found')
    return render(request, 'admin/admin-find-match.html',{"case":manage})


def admin_match_person(request,id):
    case = addcasemodel.objects.get(pk=id)
    user_cases = registercasemodel.objects.filter(status='Not Found')
    for i in user_cases:
        status = detect_face(case.photo,i.photo)
        print(status[0])
        if status[0] == True:
            print('yessss')
            i.status = 'Found'
            case.status = 'Found'
            i.save()
            case.save()
            # SMS API CODE
            url = "https://www.fast2sms.com/dev/bulkV2"
            # create a dictionary
            my_data = {'sender_id': 'FSTSMS', 
                            'message': 'Dear '+str(i.name)+', Thank You for your help in finding the missing person', 
                            'language': 'english', 
                            'route': 'q', 
                            'numbers':i.mobile,
            }
                
                # create a dictionary
            headers = {
                    'authorization': "RiE8PuQDhbLnUkKe43p5vHsta0dFTyqcoNS7xrAwC9zO2WjgVG875H0JStiefd23jxPM4aLVzrEYmvOI",
                    'Content-Type': "application/x-www-form-urlencoded",
                    'Cache-Control': "no-cache"
            }
                # make a post request
            response = requests.request("POST",
                                            url,
                                            data = my_data,
                                            headers = headers)
            print(response.text)

            messages.success(request, 'Match Found')
            return redirect('admin_find_match')
    messages.info(request, 'Match not found')
    return redirect('admin_find_match')

