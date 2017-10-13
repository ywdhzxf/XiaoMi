from django.shortcuts import render,redirect
from myadmin.models import Types,Goods
import time,re,os
from django.http import HttpResponse
from django.core.paginator import Paginator
 
from django.core.urlresolvers import reverse



# 浏览商品类别信息
def typesindex(request):
    # 执行数据查询，并放置到模板中
    list = Types.objects.extra(select = {'_has':'concat(path,id)'}).order_by('_has') 
    # 遍历查询结果，为每个结果对象追加一个pname属性，目的用于缩进标题
    for ob in list:
        ob.pname ='. . . '*(ob.path.count(',')-1)
    context = {"stulist":list}
    return render(request,'myadmin/types/index.html',context)

# 商品类别信息添加表单
def typesadd(request,tid):
    # 获取父类别信息，若没有则默认为根类别信息
    if tid == '0':
        context = {'pid':0,'path':'0,','name':'根类别'}
    else:
        ob = Types.objects.get(id=tid)
        context = {'pid':ob.id,'path':ob.path+str(ob.id)+',','name':ob.name}
    return render(request,'myadmin/types/add.html',context)

#执行商品类别信息添加    
def typesinsert(request):
    try:
        ob = Types()
        ob.name = request.POST['name']
        ob.pid = request.POST['pid']
        ob.path = request.POST['path']
        ob.save()
        context = {'info':'添加成功！'}
    except:
        context = {'info':'添加失败！'}

    return render(request,"myadmin/info.html",context)
#删除商品分类
def typesdel(request,uid):
    try:
        # 查看此类别下是否是父类别
        row = Types.objects.filter(pid=uid).count()
        if row > 0:
            context = {'info':'删除失败：此类别下还有子类别！'}
            return render(request,"myadmin/info.html",context)
        #查看此类别下是否有商品
        good = Goods.objects.filter(typeid = uid).count()
        if good > 0 :
            context = {'info':'删除失败:此类别下还有商品!'}
            return render(request,'myadmin/info.html',context)

        ob = Types.objects.get(id=uid)
        ob.delete()
        context = {'info':'删除成功'}
    except:
        context = {'info':'删除失败'}
    return render(request,'myadmin/info.html',context)
#加载修改商品分类信息
def typesedit(request,uid):
    try:
        ob = Types.objects.get(id=uid)
        oc = Types.objects.all()
        context = {'type1':ob, 'type2':oc}

        return render(request,'myadmin/types/edit.html',context)
    except:
        context = {'info':'没有要修改的信息'}
        return render(request,'myadmin/info.html',context)
#修改商品分类信息
def typesupdate(request,uid):
    try:
        a = request.POST["pid"]
        d = re.sub(r'\D','',a)
        b = Types.objects.get(id = int(d))
        c = b.path
        ob = Types.objects.get(id=uid)
        ob.name = request.POST['name']
        ob.pid = d
        ob.path = c + ','+ob.pid
        ob.save()
        context = {'info':'修改成功'}
    except:
        context = {'info':'修改失败'}
    return render(request,'myadmin/info.html',context)