from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.views.generic import View, DetailView
from django.urls import reverse
from django.core.cache import cache

from pure_pagination import Paginator, InvalidPage

from .models import Course


# 课程列表
class CourseListView(View):
    @classmethod
    def get(cls, request, order=0, page=1):
        if not order:
            order = 0
        order_list = ['add_time', 'click', 'study_num']
        course_list = Course.objects.all().order_by(order_list[int(order)])
        pagi = Paginator(course_list, 3)
        # 请求为ajax时返回列表内容
        if request.is_ajax():
            now_page = pagi.page(int(page))
            context = {'now_page': now_page}
            html = render(request, 'course/course-list-content.html', context).content.decode('utf-8')
            return JsonResponse({'status': 200, 'content': html})
        # 非ajax请求时返回页面,最热课程和页码
        else:
            hot_course = Course.objects.all().order_by('click')[:3]
            context = {'title': '公开课列表', 'pagi': pagi, 'hot_course': hot_course}
            return render(request, 'course/course-list.html', context)


# 课程详情
class CourseDetailView(View):
    @classmethod
    def get(cls, request, pk):
        try:
            course = Course.objects.get(id=int(pk))
        except Course.DoesNotExist:
            return render(request, '404.html')
        course.click += 1
        course.save()
        org = course.teacher.school
        # 导入所需模型类
        from user_operation.models import UserCollection, StudyCourse
        # 判断用户是否登录
        if request.user.is_authenticated():
            # 判断登录用户是否已收藏该课程或机构
            try:
                UserCollection.objects.get(user=request.user, type=1, collet_id=org.id)
            except UserCollection.DoesNotExist:
                org_collect_text = '收藏'
            else:
                org_collect_text = '已收藏'
            try:
                UserCollection.objects.get(user=request.user, type=3, collet_id=course.id)
            except UserCollection.DoesNotExist:
                course_collect_text = '收藏'
            else:
                course_collect_text = '已收藏'
        else:
            org_collect_text = '收藏'
            course_collect_text = '收藏'
        # 在学习这门课的用户
        study_user = StudyCourse.objects.filter(course=pk)[:6]
        # 同类课程
        related_courses = Course.objects.filter(tab=course.tab).exclude(pk=course.id)
        context = {'title': '课程详情-'+course.name,
                   'course': course,
                   'org': org,
                   'study_user': study_user,
                   'org_collect_text': org_collect_text,
                   'course_collect_text': course_collect_text,
                   'related_courses': related_courses
                   }
        return render(request, 'course/course-detail.html', context)

# 用户点击开始学习时的处理视图
    @classmethod
    def post(cls, request, pk):
        # 用户未登录返回403
        if request.user.is_authenticated():
            try:
                course = Course.objects.get(id=pk)
            except Course.DoesNotExist:
                return JsonResponse({'status': 404})
            # 用户学习的session信息中是否有这课程,session['study_course']是一个存储用户学习课程的列表
            user_study_course = request.session.get('study_course', [])
            try:
                user_study_course.index(course.name)
            except ValueError:
                # 检验用户学习的课程中是否有这门课
                from user_operation.models import StudyCourse
                try:
                    info = StudyCourse.objects.get(course=course.id, user=request.user)
                # 没有就创建,保存到session与用户学习的课程，课程学习人数+1
                except StudyCourse.DoesNotExist:
                    info = StudyCourse.objects.create(user=request.user, course=course)
                    info.save()
                    user_study_course.append(course.name)
                    course.study_num += 1
                    course.save()
                # 有的话就添加到session['study_course']中
                else:
                    user_study_course.append(course.name)
            url = reverse('course_study', kwargs={'pk': pk})
            return JsonResponse({'status': 304, 'url': url})
        else:
            return JsonResponse({'status': 403})


# 课程学习页面
class CourseStudyView(View):
    @classmethod
    def get(cls, request, pk):
        try:
            course = Course.objects.get(id=int(pk))
        except Course.DoesNotExist:
            return redirect('course_list')
        # 学习本课程的所有学生的id
        study_courses = course.studycourse_set.all()
        student = [study_course.user for study_course in study_courses]
        # 得到所有看过本视频的学生看过的所有课程
        related_course = Course.objects.filter(studycourse__user__in=student).exclude(pk=int(pk))
        context = {'title': '课程学习-'+course.name,
                   'course': course,
                   'teacher': course.teacher,
                   'resources': course.resources_set.all(),
                   'related_course': related_course}
        return render(request, 'course/course-study.html', context)


# 章节信息内容
class CourseChapterView(View):
    @classmethod
    def post(cls, request):
        # 根据pk查找视频
        pk = request.POST.get('id', None)
        if pk:
            course = Course.objects.get(pk=int(pk))
        else:
            return JsonResponse({'status': 405, 'msg': '未知错误！'})
        chapters = course.chapter_set.all()
        context = {'course': course, 'chapters': chapters}
        response = render(request, 'course/course-video.html', context)
        content = response.content.decode('utf-8')
        return JsonResponse({'status': 200, 'content': content})
