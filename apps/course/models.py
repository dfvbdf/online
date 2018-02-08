from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField


class CourseTab(models.Model):
    """课程类别"""
    name = models.CharField(verbose_name='课程类别', max_length=50)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '课程类别'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Course(models.Model):
    """课程信息"""
    name = models.CharField(verbose_name='课程名', max_length=100)
    teacher = models.ForeignKey('school.Teacher', verbose_name='讲师', null=True, blank=True)         # 避免循环导入依赖
    pic = models.ImageField(verbose_name='封面', upload_to='course/%Y/%m', default='course/python面向对象.jpg')
    time = models.IntegerField(verbose_name='时长', help_text='以分钟计')
    tab = models.ForeignKey(CourseTab, verbose_name='课程类别')
    desc = models.CharField(verbose_name='课程简介', max_length=100)
    introduce = RichTextUploadingField(verbose_name='课程详情', default='')
    public_text = models.CharField(verbose_name='课程公告', default='', max_length=50)
    level = models.IntegerField(verbose_name='课程难度', choices=((1, '初级'), (2, '中级'), (3, '高级')), default=1)
    click = models.IntegerField(verbose_name='点击量', default=0)
    collection_num = models.IntegerField(verbose_name='收藏人数', default=0)
    study_num = models.IntegerField(verbose_name='学习人数', default=0)
    tips1 = models.CharField(verbose_name='课程须知', default='', blank=True, null=True, max_length=30)
    tips2 = models.CharField(verbose_name='可以学到什么', default='', blank=True, null=True, max_length=30)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '所有课程'
        verbose_name_plural = verbose_name
        ordering = ['click']

    def __str__(self):
        return self.name

    # 获得课时数
    def get_chapter(self):
        return self.chapter_set.all().count()
    get_chapter.short_description = '总章节数'

    # level转为字符串
    def level_str(self):
        level_list = ['', '初级', '中级', '高级']
        return level_list[self.level]


class Chapter(models.Model):
    """课程章节"""
    course = models.ForeignKey(Course, verbose_name='所属课程')
    name = models.CharField(verbose_name='章节名', max_length=50)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '章节信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Video(models.Model):
    """课程视频"""
    chapter = models.ForeignKey(Chapter, verbose_name='所属章节')
    name = models.CharField(verbose_name='视频名', max_length=50)
    url = models.URLField(verbose_name='链接地址', max_length=200)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '课程视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Resources(models.Model):
    """课程资源"""
    course = models.ForeignKey(Course, verbose_name='所属课程')
    name = models.CharField(verbose_name='资源名称', max_length=50)
    download = models.FileField(upload_to='resources/%Y/%m', verbose_name='资源地址')
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
