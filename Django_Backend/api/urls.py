from django.urls import path,include
from django.urls.resolvers import URLPattern
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from . import views
urlpatterns = [
    path('',views.getRoutes),
    path('user/',views.getUsers),
    path('user/create/',views.createUser),
    path('user/<str:uname>/update/',views.updateUser),
    path('user/<str:uname>/delete/',views.deleteUser),
    path('template', TemplateView.as_view(template_name="home.html"), name='home'),
    path('user/<str:uname>',views.getSingleUser),
    path('user/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
    path('sendEmail/',views.SendFormEmail.as_view),
    path('worker/',views.getWorkers),
    path('worker/create/',views.createWorker),
    path('worker/<str:uname>/update/',views.updateWorker),
    path('worker/<str:uname>/delete/',views.deleteWorker),
    path('worker/<str:uname>',views.getSingleWorker),
    path('appointment_worker/<str:uname>',views.getAppointmentsWorker),
    path('appointment_user/<str:uname>',views.getAppointmentsUser),
    path('recent/<str:uname>',views.getRecent),
    # path('worker/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
]

urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)