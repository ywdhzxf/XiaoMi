from django.db import models

# Create your models here.
# 用户表
class Users(models.Model):
	username = models.CharField(max_length=32)
	name = models.CharField(max_length=16)
	passwd = models.CharField(max_length=32)
	sex = models.IntegerField(max_length=1)
	address = models.CharField(max_length=255)
	code = models.CharField(max_length=6)
	phone = models.CharField(max_length=16)
	email = models.CharField(max_length=50)
	state = models.IntegerField(max_length=1,default=1)
	addtime = models.IntegerField()
	def toDict(self):
		return {'id':self.id,'name':self.name}