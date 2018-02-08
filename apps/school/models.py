from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField


class City(models.Model):
    name = models.CharField(verbose_name='城市名', max_length=100)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '城市信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# class School(models.Model):
#     name = models.CharField(verbose_name='机构名', max_length=100)
#     tab = models.IntegerField(verbose_name='机构类别', choices=((1, '培训机构'), (2, '高校'), (3, '组织或个人')), default=1)
#     pic = models.ImageField(verbose_name='封面', upload_to='school/%Y/%m', max_length=100,default='/media/school/bjdx.jpg')
#     desc = models.CharField(verbose_name='机构简介', max_length=200)
#     introduce = models.TextField(verbose_name='机构介绍')
#     city = models.ForeignKey(City, verbose_name='所在城市')
#     click = models.IntegerField(verbose_name='点击量', default=0)
#     collection = models.IntegerField(verbose_name='收藏数', default=0)
#     course_num = models.IntegerField(verbose_name='课程数', default=0)
#     add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)
#
#     class Meta:
#         ordering = ('click',)
#         verbose_name = '教学机构'
#         verbose_name_plural = verbose_name
#
#     def __str__(self):
#         return self.name


class Org(models.Model):
    name = models.CharField(verbose_name='名称', max_length=20)
    tab = models.IntegerField(verbose_name='机构类别', choices=((1, '培训机构'), (2, '高校'), (3, '组织或个人')), default=1)
    pic = models.ImageField(verbose_name='封面', upload_to='school/%Y/%m', default='school/bjdx.jpg')
    desc = models.CharField(verbose_name='机构简介', max_length=200, default='全国知名')
    introduce = RichTextUploadingField(verbose_name='机构介绍', default='')
    city = models.ForeignKey(City, verbose_name='所在城市', null=True, blank=True)
    addr = models.CharField(verbose_name='详细地址', max_length=50, null=True, blank=True)
    click = models.IntegerField(verbose_name='点击量', default=0)
    collection_num = models.IntegerField(verbose_name='收藏数', default=0)
    course_num = models.IntegerField(verbose_name='课程数', default=0)
    main_course_1 = models.ForeignKey('course.Course', verbose_name='经典课程1', null=True, blank=True, related_name='main_course_1')
    main_course_2 = models.ForeignKey('course.Course', verbose_name='经典课程2', null=True, blank=True, related_name='main_course_2')
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True, null=True, blank=True)

    class Meta:
        ordering = ('click',)
        verbose_name = '教学机构'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    # 定义点击量增加函数
    def click_update(self):
        self.click += 1
        self.save()

    # 更新经典课程
    def update_org_course(self):
        from course.models import Course
        course_list = Course.objects.select_related('teacher__school').filter(teacher__school=self).order_by('click')
        try:
            self.main_course_1 = course_list[0]
            self.main_course_2 = course_list[1]
        except IndexError:
            self.main_course_1 = None
            self.main_course_2 = None

    # 该机构下课程总数
    def get_course_num(self):
        from course.models import Course
        number = Course.objects.select_related('teacher__school').filter(teacher__school=self).count()
        return number
    get_course_num.short_description = '课程总数'


class Teacher(models.Model):
    name = models.CharField(verbose_name='姓名', max_length=20)
    pic = models.ImageField(verbose_name='头像', upload_to='teacher/%Y/%m', max_length=100,
                            default='teacher/default_middile_2_WZ1559E.png')
    school = models.ForeignKey(Org, verbose_name='所属机构',)
    job = models.CharField(verbose_name='职位', max_length=50)
    worked_year = models.CharField(verbose_name='教学时间', null=True, blank=True, max_length=20, default='1')
    pointer = models.CharField(verbose_name='教学特点', max_length=100)
    collection_num = models.IntegerField(verbose_name='收藏数', default=0)
    click = models.IntegerField(verbose_name='点击量', default=0)
    add_time = models.DateField(verbose_name='添加时间', auto_now_add=True)

    class Meta:
        verbose_name = '讲师信息'
        verbose_name_plural = verbose_name
        ordering = ['click']

    def __str__(self):
        return self.name

    # 更新点击量
    def update_click(self):
        self.click += 1
        self.save()

    # 更新学习人数
    def update_study_num(self, num=1):
        self.click += num
        self.save()

    # 获得最热课程信息
    def get_course(self):
        self.course_set.all().order_by('collection_num')

    # 获得课程总数
    def get_course_num(self):
        self.course_set.all().count()

    # 获得最热课程
    def get_hot_course(self):
        try:
            hot_course = self.course_set.all()
        except IndexError:
            return None
        return hot_course

