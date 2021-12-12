from django.views import generic
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
from .models import *
from rest_framework import status
from rest_framework.permissions import IsAuthenticated,AllowAny,IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from django.shortcuts import render
from django.views.generic import View
from django.shortcuts import redirect
from django.contrib import messages
from django.core.mail import send_mail, send_mass_mail
@api_view(['GET'])
def getRoutes(request):
    routes=[
        {
            'Endpoint' : '/Django_Project/',
            'method' : 'GET',
            'username' : None,
            'password' : None,
            'ID' : None,
            'description' : 'Returns idk what but we will know soon'
        },
    ]
    return Response(routes)

@api_view(['GET'])
def getUsers(request):
    User = user.objects.all()
    serializer = userSerializer(User,many=True)
    return Response(serializer.data)

@api_view(['GET'])#GET FOR RETRIEVE 
def getSingleUser(request,uname):
    User = user.objects.get(username=uname)
    serializer = userSerializer(User,many=False)
    return Response(serializer.data)

@api_view(['POST'])#POST FOR ADD
def createUser(request):
    data = request.data
    tempU = str(data['username'])
    tempU = tempU.lower()
    tempE = str(data['email'])
    tempE = tempE.lower()
    User = user.objects.create(
        username = tempU,
        password = data['password'],
        email = tempE,
        fname = data['fname'],
        lname = data['lname'],
        contact = data['contact'],
        image = data['image'],
        address = data['address'],
    )
    serializer = userSerializer(User,many = False)
    return Response(serializer.data)

@api_view(['PUT'])#PUT FOR UPDATE
def updateUser(request,uname):
    data = request.data
    User = user.objects.get(username=uname)
    
    serializer = userSerializer(User,data=request.data)
    if serializer.is_valid():
        serializer.save()
    
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteUser(request,uname):
    User = user.objects.get(username=uname)
    User.delete()
    return Response('User was deleted')

class SendFormEmail(View):
    def  get(self, request):
        # Get the form data 
        name = request.GET.get('name', None)
        email = request.GET.get('email', None)
        message = request.GET.get('message', None)
        # Send Email
        send_mail(
            'Subject - Django Email Testing', 
            'Hello ' + name + ',\n' + message, 
            'wahajkhan788@gmail.com', # Admin
            [
                email,
            ]
        ) 
        # Redirect to same page after form submit
        messages.success(request, ('Email sent successfully.'))
        return redirect('home') 


class ImageUpload(APIView):
    def post(self,request,format=None):
        print(request.data)
        serializer = userSerializer(date=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)

#Worker

@api_view(['GET'])
def getWorkers(request):
    Worker = worker.objects.all()
    serializer = workerSerializer(Worker,many=True)
    return Response(serializer.data)

@api_view(['GET'])#GET FOR RETRIEVE 
def getSingleWorker(request,uname):
    Worker = worker.objects.get(username=uname)
    serializer = workerSerializer(Worker,many=False)
    return Response(serializer.data)

@api_view(['POST'])#POST FOR ADD
def createWorker(request):
    data = request.data
    tempU = str(data['username'])
    tempU = tempU.lower()
    tempE = str(data['email'])
    tempE = tempE.lower()
    Worker = worker.objects.create(
        username = tempU,
        password = data['password'],
        email = tempE,
        fname = data['fname'],
        lname = data['lname'],
        image = data['image'],
        category = data['category'],
    )
    serializer = workerSerializer(Worker,many = False)
    return Response(serializer.data)

@api_view(['PUT'])#PUT FOR UPDATE
def updateWorker(request,uname):
    data = request.data
    Worker = worker.objects.get(username=uname)
    
    serializer = workerSerializer(Worker,data=request.data)
    if serializer.is_valid():
        serializer.save()
    
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteWorker(request,uname):
    Worker = worker.objects.get(username=uname)
    Worker.delete()
    return Response('User was deleted')