from django.db import models

from course.models import Course
from school.models import Teacher, Org
from user.models import UserInfo


class StudyCourse(models.Model):                                    # 用户学习
    user = models.ForeignKey(UserInfo, verbose_name='用户')
    course = models.ForeignKey(Course, verbose_name='课程')
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '用户学习课程'
        verbose_name_plural = verbose_name


class UserCollection(models.Model):                                 # 用户收藏
    user = models.ForeignKey(UserInfo, verbose_name='用户')
    type = models.IntegerField(choices=((1, '机构'), (2, '讲师'), (3, '课程')), verbose_name='收藏类别', default=3)
    collet_id = models.IntegerField(verbose_name='收藏id')
    # school = models.ForeignKey(Org, verbose_name='机构', null=True, blank=True)
    # teacher = models.ForeignKey(Teacher, verbose_name='讲师', null=True, blank=True)
    # course = models.ForeignKey(Course, verbose_name='课程', null=True, blank=True)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '用户收藏'
        verbose_name_plural = verbose_name


class UserComment(models.Model):                                            # 用户评论
    user = models.ForeignKey(UserInfo, verbose_name='用户')
    course = models.ForeignKey(Course, verbose_name='课程')
    content = models.CharField(max_length=200, verbose_name='评论内容')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '用户评论'
        verbose_name_plural = verbose_name
        ordering = ['-add_time']


class UserMessage(models.Model):                                            # 个人消息
    send_user = models.ForeignKey(UserInfo, verbose_name='发件人', null=True, blank=True)      # 发件人
    recv_user = models.ForeignKey(UserInfo,verbose_name='收件人', related_name='recv_user')                           # 收件人
    content = models.CharField(verbose_name='内容', max_length=500)
    has_read = models.BooleanField(verbose_name='是否读过', default=False)
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '用户消息'
        verbose_name_plural = verbose_name


class PublicMessage(models.Model):                                            # 系统消息
    recv_user = models.IntegerField( verbose_name='收件人', default=0)         # 收件人，0为所有用户
    content = models.CharField(verbose_name='内容', max_length=500)
    has_read = models.ManyToManyField(UserInfo, verbose_name='读过此条的用户', related_name='has_read')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '系统消息'
        verbose_name_plural = verbose_name


class UserConsult(models.Model):                                # 用户咨询
    name = models.CharField(max_length=50, verbose_name='姓名')
    tell = models.CharField(verbose_name='联系电话', max_length=11)
    course = models.CharField(verbose_name='课程名', max_length=100)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '用户咨询'
        verbose_name_plural = verbose_name


class TeacherCourse(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    teacher = models.ForeignKey(Teacher, verbose_name='讲师')
    add_time = models.DateField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        verbose_name = '讲师的课程'
        verbose_name_plural = verbose_name


