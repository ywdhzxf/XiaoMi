from django.shortcuts import render,redirect
from myadmin.models import Goods,Types,Detail,Orders
from django.http import HttpResponse,JsonResponse
import time,os,json
from django.http import HttpResponse
from django.core.paginator import Paginator
 
from django.core.urlresolvers import reverse
from PIL import Image

def detailindex(request,uiddd):
    ob = Detail.objects.filter(orderid = uiddd)
    oc = Orders.objects.get(id = uiddd)
    context = {'stu':ob,'xx':oc}

    return render(request,'myadmin/detail/index.html',context)
