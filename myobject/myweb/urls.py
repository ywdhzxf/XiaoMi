
from django.conf.urls import url
from django.contrib import admin
from . import views,viewsusers,viewsorders

urlpatterns = [
    # 网站前台展示
    url(r'^$',views.index,name='index'),
    url(r'^lists$',views.lists,name='lists'), #商品列表
    url(r'^lists/(?P<tid>[0-9]+)$',views.lists,name='lists'), #商品列表
    url(r'^detail/(?P<gid>[0-9]+)$',views.detail,name='detail'), #商品详情
    url(r'^login$',viewsusers.login,name='login'), #登录
    url(r'^dolog$',viewsusers.dolog,name='dolog'), #登录验证
    url(r'^verify$', viewsusers.verify, name="verify"), #验证码
    url(r'^logout$',viewsusers.logout,name='logout'), #登录验证

    url(r'^zc$',viewsusers.zc,name='zc'), #注册
    url(r'^zcinsert$',viewsusers.zcinsert,name='zcinsert'), #注册
    url(r'^gwc$',viewsorders.gwc,name='gwc'), #购车
    url(r'^gwcinsert/(?P<uid>[0-9]+)$',viewsorders.gwcinsert,name='gwcinsert'), #添加购物车
    url(r'^gwcdel/(?P<uid>[0-9]+)$',viewsorders.gwcdel,name='gwcdel'), #添加购物车
    url(r'^gwcclear$',viewsorders.gwcclear,name='gwcclear'), #添加购物车
    url(r'^gwcchange$',viewsorders.gwcchange,name='gwcchange'), #添加购物车


    # 订单
    url(r'^ordersform$', viewsorders.ordersform,name='ordersform'), #订单表单
    url(r'^ordersconfirm$', viewsorders.ordersconfirm,name='ordersconfirm'), #订单确认
    url(r'^ordersinsert$', viewsorders.ordersinsert,name='ordersinsert'), #执行订单添加
    url(r'^ordersinfo$', viewsorders.ordersinfo,name='ordersinfo'), #订单信息

    #用户中心
    url(r'^user$', viewsusers.user,name='user'), 
    url(r'^userxg$', viewsusers.userxg,name='userxg'), #修改用户信息
    url(r'^ysh/(?P<uid>[0-9]+)$', viewsusers.ysh,name='ysh'), #已收货


]
