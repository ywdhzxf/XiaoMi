
from myadmin.models import Goods,Types,Users
from django.shortcuts import render,redirect
import time
from django.http import HttpResponse
from django.core.paginator import Paginator
 
from django.core.urlresolvers import reverse

def loadContext(request):
    context={}
    context['typelist'] = Types.objects.filter(pid=0)
    return context


# 首页
def index(request):
    context = loadContext(request)
    # 精选商品
    context['good'] = Goods.objects.order_by('num')[0:12]
    # 小米明星单品
    context['list'] = Goods.objects.order_by('num')[6:10]
    context['list1'] = Goods.objects.order_by('num')[12:16]
    #特效
    context['lists'] = Goods.objects.order_by('num')[10:14]
    return render(request,'myweb/index.html',context)

# 列表页
def lists(request,tid=0):
    context = loadContext(request)
    # 获取所需商品列表信息并放置到context
    if tid == 0:
        context['stulist'] = Goods.objects.all()
    else:
        #获取当前类别下的所有子类别信息
        context['types'] = Types.objects.filter(pid=tid)
        # 判断参数ttid是否有值
        if request.GET.get('ttid',None):
            context['stulist'] = Goods.objects.filter(typeid=request.GET['ttid'])
        else:
            # 获取指定商品类别下的所有商品信息
            context['stulist'] = Goods.objects.filter(typeid__in=Types.objects.only('id').filter(path__contains=','+str(tid)+','))
    # 如tid=1的sql：select * from myweb_goods where typeid in(select id from myweb_type where path like '%,1,%')
    return render(request,'myweb/lists.html',context)


# 商品详情
def detail(request,gid):
    # context = loadContext(request)
    ob = Goods.objects.get(id=gid)
    ob.clicknum +=1
    ob.save()
    context1 = {'oblist':ob}
    return render(request,'myweb/detail.html',context1)




