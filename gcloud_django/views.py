from django.http.response import JsonResponse


def hello_world(request):
    return JsonResponse(data='Hell World, It\'s Me', safe=False)
