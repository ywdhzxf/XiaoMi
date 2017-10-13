from myadmin.models import Goods,Types,Users,Orders,Detail
from django.shortcuts import render,redirect
import time
from django.http import HttpResponse
from django.core.paginator import Paginator
from django.core.urlresolvers import reverse

def loadContext(request):
    context={}
    context['typelist'] = Types.objects.filter(pid=0)
    return context

#购物车
def gwc(request):
    context = loadContext(request)
    context['good'] = Goods.objects.all()
    if 'shoplist' in request.session:
        pass
    else:
        shoplist = {}
    return render(request,'myweb/gwc.html',context)

#购物车添加
def gwcinsert(request,uid):
    ob = Goods.objects.get(id=uid)
    shop = ob.toDict()
    shop['m'] = int(request.POST['m'])
    # 判断商品是否加载到购物车
    if 'shoplist' in request.session:
        shoplist = request.session['shoplist']
    else:
        shoplist = {}
    # 判断商品是否已经在购物车中
    if uid in shoplist:
        shoplist[uid]['m'] += shop['m']
    else:
        # 放入购物车
        shoplist[uid] = shop
    request.session['shoplist'] = shoplist
    # 跳到浏览购物车的方法
    return redirect(reverse('gwc'))

#购物车删除
def gwcdel(request,uid):
    shoplist = request.session['shoplist']
    del shoplist[uid]
    request.session['shoplist'] = shoplist
    return redirect(reverse('gwc'))
#购物车清空
def gwcclear(request):
    shoplist = request.session['shoplist']
    request.session['shoplist'] = {}
    return redirect(reverse('gwc'))
#购物车修改
def gwcchange(request):
    # context = loadContext(request)
    # num = int(request.GET.get('m'))
    # if num <= 1:
    #     num = 1
    # request.session['shoplist'][request.GET.get('sid')]['m']= num

    context = loadContext(request)
    shoplist = request.session['shoplist']
    #获取信息
    shopid = request.GET['sid']
    num = int(request.GET['m'])
    if num<1:
        num = 1
    shoplist[shopid]['m'] = num #更改商品数量
    request.session['shoplist'] = shoplist
    return render(request,"myweb/gwc.html",context)


#================订单处理================================
#订单表单页
def ordersform(request):
    #获取要结账的商品id信息
    ids = request.GET['gids']
    if ids == '':
        return HttpResponse("请选择要结账的商品")
    gids = ids.split(',')
    # 获取购物车中的商品信息
    shoplist = request.session['shoplist']
    #封装要结账的商品信息，以及累计总金额
    orderlist = {}
    total = 0
    for sid in gids:
        orderlist[sid] = shoplist[sid]
        total += shoplist[sid]['price']*shoplist[sid]['m'] #累计总金额
    request.session['orderlist'] = orderlist
    request.session['total'] = total
    ob = Users.objects.get(name = request.session['yonghu'])
    ob.addtime = time.time()

    context = {'userlist':ob}
  
    return render(request,"myweb/ordersform.html",context)


#订单确认页
def ordersconfirm(request):

    return render(request,"myweb/ordersconfirm.html")

#执行订单添加
def ordersinsert(request):
    # 封装订单信息，并执行添加
    orders = Orders()
    orders.uid = Users.objects.get(name = request.session['yonghu']).id
    orders.linkman = request.POST['username'] 
    orders.address = request.POST['address']
    orders.code = request.POST['code']
    orders.phone = request.POST['phone']
    orders.addtime = time.time()
    orders.total = request.session['total']
    orders.status = 0
    orders.save()
    #获取订单详情
    orderlist = request.session['orderlist']
    shoplist = request.session['shoplist']

    #遍历购物信息，并添加订单详情信息
    for shop in orderlist.values():
        print(shop)
        detail = Detail()
        detail.orderid = orders.id
        detail.goodsid = shop['id']
        # detail.picname = shop['picname']
        detail.name = shop['goods']
        detail.price = shop['price']
        detail.num = shop['m']
        detail.save()
        shoplist.pop(str(shop['id']))
        request.session['shoplist'] = shoplist
    return redirect(reverse('ordersinfo'))
    # return HttpResponse("订单成功：订单id号："+str(orders.id))

#提示信息
def ordersinfo(request):
    
    context = { 'info':"订单成功!!!"}
    return render(request,'myweb/info.html',context)
 