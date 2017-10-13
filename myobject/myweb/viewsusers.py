
from myadmin.models import Goods,Types,Users,Detail,Orders
from django.shortcuts import render,redirect
import time
from django.http import HttpResponse
from django.core.paginator import Paginator
 
from django.core.urlresolvers import reverse


#登录
def login(request):
    return render(request,'myweb/login.html')
##登录验证
def dolog(request):
    # 校验验证码
    verifycode = request.session['verifycode']
    code = request.POST["code"]
    if verifycode != code:
        context = {'info':'验证码错误'}
        return render(request,'myweb/login.html',context)
    # try:
    user=Users.objects.get(username=request.POST['username'])
    # 判断当前用户是否是后台管理员    
    if user.state == 1:
        # 验证密码SSS
        import hashlib
        m = hashlib.md5()
        m.update(bytes(request.POST['passwd'],encoding = 'utf8'))
        if user.passwd == m.hexdigest():
            
            #此处登录成功,将当前登录信息放入到session中,并跳转页面
            request.session['yonghu'] = user.name
            return redirect(reverse('index'))
        else:
            context = {'info':'登录密码错误'}
    else:
        context = {'info':'此用户非后台管理用户'}
    # except:
    #     context = {'info':'登录账号错误'}
        
    return render(request,'myweb/index.html',context)
#验证码操作
def verify(request):
    #引入随机函数模块
    import random
    from PIL import Image, ImageDraw, ImageFont
    #定义变量，用于画面的背景色、宽、高
    #bgcolor = (random.randrange(20, 100), random.randrange(
    #    20, 100),100)
    
    
    bgcolor = (242,164,247)
    width = 100
    height = 35
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象，ubuntu的字体路径为“/usr/share/fonts/truetype/freefont”
    font = ImageFont.truetype('static/STXIHEI.TTF', 21)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, 0), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 0), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, 0), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 0), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    """
    python2的为
    # 内存文件操作
    import cStringIO
    buf = cStringIO.StringIO()
    """
    # 内存文件操作-->此方法为python3的
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')

# 退出登录
def logout (request):
    # 清除登录的session信息
    del request.session['yonghu']
    # 跳转登录页面（url地址改变）
    return redirect(reverse('login'))
    # 加载登录页面(url地址不变)
    return render(request,"myweb/login.html")

#注册
def zc(request):
    return render(request,'myweb/zc.html')
##注册过程
def zcinsert(request):
    try:
        ob = Users()
        ob.username = request.POST['username']
        ob.name = request.POST['name']
        # 进行加密
        import hashlib
        m=hashlib.md5() 
        m.update(bytes(request.POST['passwd'],encoding="utf8"))
        ob.passwd = m.hexdigest()
       
        ob.sex = request.POST['sex']
        ob.address = request.POST['address']
        ob.code = 220077
        ob.phone = request.POST['phone']
        ob.email = request.POST['email']
        ob.state = 1
        ob.addtime = time.time()
        ob.save()
        context = {'info':'添加成功'}
    except:
        context = {'info':'添加失败'}
    return render(request,'myadmin/info.html',context)
# 查询当前用户订单
def user(request):
    # 通过用户名来找用户ID
    uid = Users.objects.get(name = request.session['yonghu']).id
    # 通过会员ID来找所有的订单ID
    
    shoplist = Orders.objects.filter(uid = uid)
    for x in shoplist:
        shop = []
        shop = Detail.objects.filter(orderid = x.id)
        #print(x.id)
        x.detaillist = shop 

    # 获取当前的用户信息
    userlist = Users.objects.get(name = request.session['yonghu'])
    context = {'stulist':shoplist,'userlist':userlist}


    return render(request,'myweb/yhzx.html',context)

# 修改用户信息
def userxg(request):
    try:
        ob = Users.objects.get(name = request.session['yonghu'])
        ob.name = request.POST['name']
        ob.address = request.POST['address']
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.addtime = time.time()
        ob.save()
        return HttpResponse('修改成功')
    except:
        return HttpResponse('修改失败')

def ysh(request,uid):
    ob = Orders.objects.get(id=uid)
    if ob.status == 1:
        ob.status = 2
        ob.save()
        return redirect(reverse('user'))
    else:
        return HttpResponse('商家还未发货')
     

