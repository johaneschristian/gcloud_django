from django.http.response import JsonResponse
import os


def hello_world(request):
    return JsonResponse(data='Hello World', safe=False)


def get_cloud_run_url(request):
    cloud_run_url = os.getenv('CLOUDRUN_SERVICE_URL', default='Not Found')
    return JsonResponse(data=cloud_run_url, safe=False)


def get_environ(request):
    environs = dict(os.environ)
    return JsonResponse(data=environs, safe=False)