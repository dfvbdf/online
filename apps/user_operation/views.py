from django.shortcuts import render
from django.http import JsonResponse
from django.views.generic import View
from django.views.generic.base import TemplateView
from django.core.cache import cache
from django.db.models import Q

from user_operation.models import *
from user.models import UserInfo, Banner
from course.models import Course
from school.models import Org, Teacher
from .models import UserComment, UserCollection, StudyCourse, UserMessage, PublicMessage
from .forms import UserConsultForm, UserUploadPicForm, ChangeUserInfoForm


# 用户中心
class UserCenterView(View):
    # 非ajax请求返回基础页面
    @classmethod
    def get(cls, request):
        context = {'title': '用户中心'}
        return render(request, 'usercenter/base-usercenter.html', context)

    @classmethod
    def post(cls, request):
        # 获取用户点了哪个tab
        tab = int(request.POST.get('tab', 0))
        context = {}
        # 用户点击我的课程tab时
        if tab == 1:
            study_course = StudyCourse.objects.filter(user=request.user)
            context = {'study_course': study_course}
        # 用户点击我的收藏时
        elif tab == 2:
            # 分类筛选出用户所有收藏
            user_collect_org = UserCollection.objects.filter(user=request.user, type=1)
            user_collect_teacher = UserCollection.objects.filter(user=request.user, type=2)
            user_collect_course = UserCollection.objects.filter(user=request.user, type=3)
            collect_org = [Org.objects.get(pk=org.collet_id) for org in user_collect_org]
            collect_teacher = [Teacher.objects.get(pk=teacher.collet_id) for teacher in user_collect_teacher]
            collect_course = [Course.objects.get(pk=course.collet_id) for course in user_collect_course]
            context = {'collect_org': collect_org, 'collect_teacher': collect_teacher, 'collect_course': collect_course}
        # 用户点击我的消息时
        elif tab == 3:
            # 查询我的消息和系统消息
            user_message = UserMessage.objects.filter(recv_user=request.user)
            public_message = PublicMessage.objects.filter(Q(recv_user=request.user.id) | Q(recv_user=0))
            # 全部设为已读
            user_message.update(has_read=True)
            for message in public_message:
                message.has_read.add(request.user)
            context = {'user_message': user_message, 'public_message': public_message}
        templates = ['usercenter/usercenter-info.html', 'usercenter/usercenter-mycourse.html',
                     'usercenter/usercenter-mycollect.html', 'usercenter/usercenter-message.html']
        # 根据tab渲染模板，将模板转编码
        content = render(request, templates[tab], context).content.decode('utf-8')
        return JsonResponse({'status': 200, 'content': content})


# # 搜索结果页面
# class SearchView(View):
#     @classmethod
#     def get(cls, request):


# 修改用户头像
class UploadUserPicView(View):
    @classmethod
    def post(cls, request):
        upload_img_form = UserUploadPicForm(request.POST, request.FILES)
        if upload_img_form.is_valid():
            pass


# 修改用户信息
class ChangeUserInfoView(View):
    @classmethod
    def post(cls, request):
        change_form = ChangeUserInfoForm(request.POST, instance=request.user)   # 用modelform修改时需要指定一个实例
        if change_form.is_valid():
            change_form.save()
            # data = change_form.cleaned_data
            # user = UserInfo.objects.filter(username=request.user.username)
            # user.update(data)
            return JsonResponse({'status': 200})
        else:
            return JsonResponse({'status': 404, 'errors': change_form.errors})


# 用户咨询视图
class UserConsultView(View):
    @classmethod
    def post(cls, request):
        if request.is_ajax():
            # modelform验证合法后直接保存
            user_consult = UserConsultForm(request.POST)
            if user_consult.is_valid():
                user_consult.save()
                return JsonResponse({'status': 1})
            else:
                errors = user_consult.errors
                return JsonResponse({'errors': errors})


# 用户收藏/取消收藏
class CollectionView(View):

    @classmethod
    def post(cls, request):
        # 判断用户是否登录
        if request.user.is_authenticated():
            try:
                collect_id = int(request.POST.get('collect_id'))
            except:
                return JsonResponse({'status': 405})
            try:
                collect_type = request.POST.get('collect_type')
            except:
                return JsonResponse({'status': 405})
            user = request.user
            # 收藏类型对应的模型类
            collect_model = [Org, Teacher, Course][int(collect_type)-1]
            try:
                collect_obj = collect_model.objects.get(id=int(collect_id))
            except collect_model.DoesNotExist:
                return JsonResponse({'status': 206, 'collect_status': '收藏'})
            # 查询有无此条收藏数据，有就删除，没有就创建
            try:
                is_collect = UserCollection.objects.get(user=user, type=collect_type, collet_id=collect_id)
            except UserCollection.DoesNotExist:
                UserCollection.objects.create(user=user, type=collect_type, collet_id=collect_id)
                collect_obj.collection_num += 1
                collect_obj.save()
                return JsonResponse({'status': 201, 'collect_status': '已收藏'})
            else:
                is_collect.delete()
                if collect_obj.collection_num > 0:
                    collect_obj.collection_num -= 1
                    collect_obj.save()
                else:
                    collect_obj.collection_num = 0
                return JsonResponse({'status': 206, 'collect_status': '收藏'})
        # 用户未登录返回404
        else:
            return JsonResponse({'status': 404})


# 用户评论视图
class UserCommentView(View):
    @classmethod
    def post(cls, request):
        # 根据pk查找视频,找不到返回405
        pk = request.POST.get('id', None)
        if pk:
            course = Course.objects.get(pk=int(pk))
        else:
            return JsonResponse({'status': 405, 'msg': '不合法的提交'})
        comment = request.POST.get('comment_text', '')
        # 判断用户是否在10秒内评论过
        is_comment = cache.get(request.user.username+course.name+'is_comment', 0)
        if not is_comment:
            # 判断评论长度，不小于5时保存,并在缓存中设置用户已评论
            if len(comment) < 5:
                return JsonResponse({'status': 405, 'msg': '输入长度不能小于5个字符！'})
            else:
                user_comment = UserComment.objects.create(user=request.user, course=course, content=comment)
                user_comment.save()
                cache.set(request.user.username+course.name+'is_comment', 1, 10)
            all_comment = UserComment.objects.filter(course=course)
        else:
            return JsonResponse({'status': 405, 'msg': '您评论的太快了，请稍后提交评论'})
        content = render(request, 'course/course-comment.html',
                         context={'all_comment': all_comment}).content.decode('utf-8')
        return JsonResponse({'status': 200, 'content': content})


# 呈现课程评论视图
class ShowCommentView(View):
    @classmethod
    def post(cls, request):
        # 根据pk查找视频,找不到返回405
        pk = request.POST.get('id', None)
        if pk:
            course = Course.objects.get(pk=int(pk))
        else:
            return JsonResponse({'status': 405, 'msg': '不合法的提交'})
        # 获取该课程下所有评论并返回200
        all_comment = UserComment.objects.filter(course=course)
        context = {'all_comment': all_comment}
        response = render(request, 'course/course-comment.html', context)
        content = response.content.decode('utf-8')
        return JsonResponse({'status': 200, 'content': content})


# 首页
class IndexView(View):
    @classmethod
    def get(cls, request):
        path = request.path
        # 查询所有banner，按index排序
        banners = Banner.objects.all().order_by('-index')
        # 按点击量查6个课程
        courses = Course.objects.all().order_by('-click')
        if courses.count() >= 6:
            courses = courses[:6]
        # 按点击量查15个机构
        orgs = Org.objects.all().order_by('-click')
        if orgs.count() >= 15:
            orgs = orgs[:15]
        context = {'title': '首页', 'banners': banners, 'courses': courses, 'orgs': orgs}
        return render(request, 'index.html', context)


# 400页面
def page_not_found(request):
    return render(request, '404.html')


# 500页面
def page_error(request):
    return render(request, '500.html')


# 403页面
def permission_denied(request):
    return render(request, '403.html')
