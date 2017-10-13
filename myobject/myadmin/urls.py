
from django.conf.urls import url
from django.contrib import admin
from . import views,viewsgoods,viewstypes,viewsorders,viewsdetail

urlpatterns = [
    # 后台首页
    url(r'^$',views.index,name='myadmin_index'),
    #------------------后台会员操作
    url(r'^login',views.login,name='myadmin_login'),
    url(r'^dologin',views.dologin,name='myadmin_dologin'),
    url(r'^logout',views.logout,name='myadmin_logout'),
    url(r'^verify$', views.verify, name="myadmin_verify"), #验证码
    #--------------------- 后台用户管理
    url(r'^users/(?P<pIndex>[0-9]*)/$',views.usersindex,name='myadmin_usersindex'),
    url(r'^usersadd$',views.usersadd,name='myadmin_usersadd'),
    url(r'^usersinsert$',views.usersinsert,name='myadmin_usersinsert'),
    url(r'^usersdel/(?P<uid>[0-9]+)$',views.usersdel,name='myadmin_usersdel'),
    url(r'^usersedit/(?P<uid>[0-9]+)$',views.usersedit,name='myadmin_usersedit'),
    url(r'^usersupdate/(?P<uid>[0-9]+)$',views.usersupdate,name='myadmin_usersupdate'),
    #--------------------商品信息表
    url(r'^goods/(?P<pIndex>[0-9]*)/$',viewsgoods.goodsindex,name='myadmin_goodsindex'),
    url(r'^goodsadd$',viewsgoods.goodsadd,name='myadmin_goodsadd'),
    url(r'^goodsinsert$',viewsgoods.goodsinsert,name='myadmin_goodsinsert'),
    url(r'^goodsdel/(?P<uid>[0-9]+)$',viewsgoods.goodsdel,name='myadmin_goodsdel'),
    url(r'^goodsedit/(?P<uid>[0-9]+)$',viewsgoods.goodsedit,name='myadmin_goodsedit'),
    url(r'^goodsupdate/(?P<uid>[0-9]+)$',viewsgoods.goodsupdate,name='myadmin_goodsupdate'),
    #---------------------商品分类表
    # url(r'^types/(?P<pIndex>[0-9]*)/$',viewstypes.typesindex,name='myadmin_typesindex'),
    url(r'^types$',viewstypes.typesindex,name='myadmin_typesindex'),
    url(r'^typesadd/(?P<tid>[0-9]+)$',viewstypes.typesadd,name='myadmin_typesadd'),
    url(r'^typesinsert$',viewstypes.typesinsert,name='myadmin_typesinsert'),
    url(r'^typesdel/(?P<uid>[0-9]+)$',viewstypes.typesdel,name='myadmin_typesdel'),
    url(r'^typesedit/(?P<uid>[0-9]+)$',viewstypes.typesedit,name='myadmin_typesedit'),
    url(r'^typesupdate/(?P<uid>[0-9]+)$',viewstypes.typesupdate,name='myadmin_typesupdate'),
    #---------------------订单表
    url(r'^orders/(?P<pIndex>[0-9]*)/$',viewsorders.ordersindex,name='myadmin_ordersindex'), 
    url(r'^ordersedit/(?P<uid>[0-9]*)/$',viewsorders.ordersedit,name='myadmin_ordersedit'), 
    url(r'^ordersupdate/(?P<uid>[0-9]*)/$',viewsorders.ordersupdate,name='myadmin_ordersupdate'), 
    #---------------------订单详情表
    url(r'^detail/(?P<uiddd>[0-9]+)/$',viewsdetail.detailindex,name='myadmin_detailindex'),
]