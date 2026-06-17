from django.shortcuts import render,redirect
from userapp.models import *
from django.contrib import messages
from adminapp.models import *
from textblob import TextBlob

# Create your views here.

def main_userregistration(request):
    if request.method == "POST" and request.FILES['photo']:
        
        name = request.POST.get("name")
        father = request.POST.get("father")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        gender = request.POST.get("gender")
        dob = request.POST.get("dob")
        city = request.POST.get("city")
        password = request.POST.get("password")
        photo = request.FILES['photo']
        
        try:
            usermodel.objects.get(email=email)
            messages.info(request,"email already existed")
            return redirect('main_userregistration')
        except:
            usermodel.objects.create(
                name = name,
                father = father,
                email = email,
                phone = phone,
                gender = gender,
                dob = dob,
                city = city,
                password = password,
                photo = photo,
            )
            messages.success(request,"You Have Registered Sucessfully")
            return redirect('main_userlogin')
        
    return render(request,"main/main-userregistration.html")

def main_userlogin(request):
    if request.method == "POST":
        
        email = request.POST.get("email")
        password = request.POST.get("password")
        
        try:
            user_registrations = usermodel.objects.get(email = email ,password = password)
            request.session['user_id'] = user_registrations.user_id
            
            messages.success(request,"login successfully")
            return redirect("user_dashboard")
        
        except:
            messages.error(request,"invalid username and passsword")
            return redirect("main_userlogin")
        
    return render(request,"main/main-userlogin.html")

def user_dashboard(request):
    user1 = usermodel.objects.all().count()
    user2 = registercasemodel.objects.all().count()
    user3 = addcasemodel.objects.all().count()
    case_id = request.session['user_id']
    user = usermodel.objects.get(user_id = case_id)
    cases = registercasemodel.objects.filter(user_case = user.user_id).count()
    return render(request,"user/user-dashboard.html",{"user1":user1,"user2":user2,"user3":user3,"cases":cases})

def user_registercase(request):
    case_id = request.session['user_id']
    user = usermodel.objects.get(user_id = case_id)

    if request.method == "POST":
        name = request.POST.get("name")
        mobile = request.POST.get("moblie")
        email = request.POST.get("email")
        description = request.POST.get("description")
        photo = request.FILES["photo"]
        
        
        registercasemodel.objects.create(
            name = name,
            mobile = mobile,
            email = email,
            description = description,
            photo = photo,
            user_case = user
        )
        print(name,"tiger")
        messages.success(request,"Case has been register Successfully")        
    return render(request,"user/user-registercase.html")

def user_cases(request):

    cases = addcasemodel.objects.filter(status='Not Found')
    return render(request,"user/user-cases.html",{'user':cases})

def user_feedback(request):
    user_id = request.session['user_id']
    user = usermodel.objects.get(pk = user_id)
    # user1 = userfeedback.objects.get(feedback2_id = user_id)
    
    if request.method == "POST":
        overall = request.POST.get('rating1')
        caseregister = request.POST.get('rating2')
        suggestion = request.POST.get('commentText')
        analysis = TextBlob(suggestion)
        
        
        if not overall:
            messages.info(request,"Please give the overall ratings")
            return redirect(user_feedback)
        if not caseregister:
            messages.info(request,"Please give the caseregister ratings")
            return redirect(user_feedback)
        sentiment = ''
        if analysis.polarity >= 0.5:
            sentiment = 'VeryPositive'
        elif analysis.polarity > 0 and analysis.polarity < 0.5:
            sentiment = 'Positive'
        elif analysis.polarity < 0 and analysis.polarity >= -0.5:
            sentiment = 'Negative'
        elif analysis.polarity <= -0.5:
            sentiment = 'VeryNegative'
        else:
            sentiment = 'Neutral'
            
        try:
            userfeedback.objects.get(feedback2_id = user)
            messages.info(request,"Feedback has already sended")
            return redirect('user_feedback')
        except:

            
            userfeedback.objects.create(overall=overall,caseregister=caseregister,suggestion=suggestion,feedback2 = user, sentiment=sentiment)
            messages.success(request,"Feedback has been send successfully")
    
    return render(request,"user/user-feedback.html",{'np':user})

def user_myprofile(request):
    id = request.session['user_id']
    user = usermodel.objects.get(user_id = id)
    if request.method == "POST":
        name = request.POST.get('name')
        father = request.POST.get('father')
        gender = request.POST.get('gender')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        dob = request.POST.get('dob')
        
        if not request.FILES.get('photo',False):
            user.name = name
            user.father = father
            user.email = email
            user.gender = gender
            user.phone = mobile
            user.dob = dob
            
        if request.FILES.get('photo',False):
            image = request.FILES['photo']
            user.name = name
            user.father = father
            user.email = email
            user.gender = gender
            user.phone = mobile
            user.dob = dob
            user.photo = image
        user.save()
        messages.success(request,"profile updated sucessfully")
        return redirect('user_myprofile')
    return render(request,"user/user-myprofile.html",{"user":user})

def user_status(request):
    case_id = request.session['user_id']
    user = usermodel.objects.get(user_id = case_id)
    cases = registercasemodel.objects.filter(user_case = user.user_id).order_by('status')
    return render(request,"user/user-status.html",{"user":cases})

