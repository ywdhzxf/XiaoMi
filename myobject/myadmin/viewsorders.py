from django.shortcuts import render,redirect
from myadmin.models import Orders
from django.http import HttpResponse,JsonResponse
import time
from django.http import HttpResponse
from django.core.paginator import Paginator
from django.core.urlresolvers import reverse

#查看订单详情信息
def ordersindex(request,pIndex):
    # 执行数据查询，并放置到模板中
    list = Orders.objects.all()
    p = Paginator(list,5)
    if pIndex=="":
        pIndex = '1'
    pIndex = int(pIndex)
    list2 = p.page(pIndex)
    plist = p.page_range
    #context = {"stulist":list}
    return render(request,'myadmin/orders/index.html',{'stulist':list2,'pIndex':pIndex,'plist':plist})

#加载修改订单详情信息
def ordersedit(request,uid):
    try:
        ob = Orders.objects.get(id=uid)
        context = {'order':ob}
        return render(request,'myadmin/orders/edit.html',context)
    except:
        context = {'info':'没有要修改的信息'}
        return render(request,'myadmin/info.html',context)
# #修改订单详情信息
def ordersupdate(request,uid):
    try:
        ob = Orders.objects.get(id=uid)
        ob.uid = request.POST['uid']
        ob.linkman = request.POST['linkman']
        ob.address = request.POST['address']
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.addtime = time.time()
        ob.total = request.POST['total']
        ob.status = request.POST['status']
        ob.save()
        context = {'info':'修改成功'}
    except:
        context = {'info':'修改失败'}
    return render(request,'myadmin/info.html',context)