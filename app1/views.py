# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse
import datetime
# Create your views here.
def  datetimeview(request):
	date=datetime.datetime.now()
	hours=int(date.strftime("%H"))
	dict1={"date":date,"Hours":hours}
	return render(request,"app1/request.html",dict1)
