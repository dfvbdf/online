from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models import Q


class UserInfo(AbstractUser):           # 自定义用户信息类，继承AbstractUser,同时要在settings中声明
    nickname = models.CharField(verbose_name='昵称', max_length=50, default='')
    birthday = models.DateField(verbose_name='生日', null=True, blank=True)
    gender = models.IntegerField(verbose_name='性别', choices=((1, '男'), (2, '女')), default=1)
    address = models.CharField(verbose_name='地址', max_length=200, default='')
    tell = models.CharField(verbose_name='电话', default='', max_length=11)
    pic = models.ImageField(verbose_name='头像', upload_to='user_head_pic/%Y/%m',
                            max_length=100, default='user_head_pic/default_middile_2.png')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    # 获取用户未读消息数
    def get_message(self):
        from user_operation.models import UserMessage, PublicMessage
        # 未读个人消息数量
        not_read = UserMessage.objects.filter(recv_user=self, has_read=False).count()
        # 未读系统消息数
        public_messages = PublicMessage.objects.filter(Q(recv_user=self.id) | Q(recv_user=0))
        for message in public_messages:
            if self not in message.has_read.all():
                not_read += 1
        return not_read


class EmailVerifyRecord(models.Model):                          # 用来存储邮箱验证码，以完成验证
    code = models.CharField(verbose_name='验证码', max_length=20)
    email = models.EmailField(verbose_name='邮箱', max_length=50)
    send_type = models.IntegerField(verbose_name='类型', choices=((1, '注册'), (2, '找回密码')))
    send_time = models.DateTimeField(verbose_name='发送时间', auto_now_add=True)
    # 调用发送邮件的函数

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name


class Banner(models.Model):                                     # 轮播图
    name = models.CharField(verbose_name='名称', max_length=50)
    pic = models.ImageField(verbose_name='轮播图', max_length=100, upload_to='banner/%Y%m')
    url = models.URLField(verbose_name='链接地址', max_length=200)
    index = models.IntegerField(verbose_name='顺序', default=100)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name





