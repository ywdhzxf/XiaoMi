from django.shortcuts import render,redirect
from myadmin.models import Users,Goods
import time
from django.http import HttpResponse
from django.core.paginator import Paginator
 
from django.core.urlresolvers import reverse
# Create your views here.
def index(request):

    return render(request,'myadmin/index.html')

# ---------------------后台会员操作
#会员登录表单
def login(request):
    return render(request,'myadmin/login.html')
#会员的登录
def dologin(request):
    # 校验验证码
    verifycode = request.session['verifycode']
    code = request.POST["code"]
    if verifycode != code:
        context = {'info':'验证码错误'}
        return render(request,'myadmin/login.html',context)
    # try:
    user=Users.objects.get(username=request.POST['username'])
    # 判断当前用户是否是后台管理员    
    if user.state == 0:
        # 验证密码SSS
        import hashlib
        m = hashlib.md5()
        m.update(bytes(request.POST['passwd'],encoding = 'utf8'))
        if user.passwd == m.hexdigest():
            
            #此处登录成功,将当前登录信息放入到session中,并跳转页面
            request.session['adminuser'] = user.name
            return redirect(reverse('myadmin_index'))
        else:
            context = {'info':'登录密码错误'}
    else:
        context = {'info':'此用户非后台管理用户'}
    # except:
    #     context = {'info':'登录账号错误'}
        
    return render(request,'myadmin/login.html',context)
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
    height = 25
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


# 退出后台管理员
def logout (request):
    # 清除登录的session信息
    del request.session['adminuser']
    # 跳转登录页面（url地址改变）
    return redirect(reverse('myadmin_login'))
    # 加载登录页面(url地址不变)
    return render(request,"myadmin/login.html")


# ---------------------后台会员管理

#查看会员信息
def usersindex(request,pIndex):
    # 执行数据查询，并放置到模板中
    list = Users.objects.all()
    p = Paginator(list,5)
    if pIndex=="":
        pIndex = '1'
    pIndex = int(pIndex)
    list2 = p.page(pIndex)
    plist = p.page_range
    #context = {"stulist":list}
    return render(request,'myadmin/users/index.html',{'stulist':list2,'pIndex':pIndex,'plist':plist})
#加载添加会员信息
def usersadd(request):
    return render(request,'myadmin/users/add.html')
#添加会员
def usersinsert(request):
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
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.email = request.POST['email']
        ob.state = request.POST['state']
        ob.addtime = time.time()
        ob.save()
        context = {'info':'添加成功'}
    except:
        context = {'info':'添加失败'}
    return render(request,'myadmin/info.html',context)
#删除会员
def usersdel(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        ob.delete()
        context = {'info':'删除成功'}
    except:
        context = {'info':'删除失败'}
    return render(request,'myadmin/info.html',context)
#加载修改会员信息
def usersedit(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        context = {'user':ob}
        return render(request,'myadmin/users/edit.html',context)
    except:
        context = {'info':'没有要修改的信息'}
        return render(request,'myadmin/info.html',context)
#修改会员信息
def usersupdate(request,uid):
    try:
        ob = Users.objects.get(id=uid)
        ob.username = request.POST['username']
        ob.name = request.POST['name']
        ob.passwd = request.POST['passwd']
        ob.sex = request.POST['sex']
        ob.address = request.POST['address']
        ob.code = request.POST['code']
        ob.phone = request.POST['phone']
        ob.email = request.POST['email']
        ob.state = request.POST['state']
        ob.addtime = time.time()
        ob.save()
        context = {'info':'修改成功'}
    except:
        context = {'info':'修改失败'}
    return render(request,'myadmin/info.html',context)
