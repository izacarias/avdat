from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
	# context = {'teste': }
	return render(request, 'acidentes/index.html')