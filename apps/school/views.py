from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.views.generic.base import View
# from django.core.paginator import Paginator, PageNotAnInteger, InvalidPage, EmptyPage
from pure_pagination import Paginator, PageNotAnInteger, InvalidPage
from course.models import Course

from .models import City, Org, Teacher
from user_operation.models import UserCollection


# 机构列表视图
class OrgListView(View):

    @classmethod
    def get(cls, request, page=1):
        context = {'title': '课程机构列表', 'tab': '公开课程'}
        # 请求是ajax的话
        if request.is_ajax():
            order_type = ['-click', '-collection_num', '-course_num']
            order = int(request.GET.get('order', 0))
            # 根据tab和city筛选,order排序
            screen = {}
            for k, v in request.GET.items():
                if k in ['tab', 'city'] and v != '0':
                    screen[k] = v
            org_list = Org.objects.filter(**screen).order_by(order_type[order])
            # if tag:
            #     if city:
            #         org_list = Org.objects.filter(tab=tag).filter(city=city).order_by(orders[order])
            #     else:
            #         org_list = Org.objects.filter(tab=tag).order_by(orders[order])
            # else:
            #     if city:
            #         org_list = Org.objects.filter(city=city).order_by(orders[order])
            #     else:
            #         org_list = Org.objects.all().order_by(orders[order])
            # 分页设置
            pages = Paginator(org_list, 2, request=request)
            try:
                now_page = pages.page(page)
            except PageNotAnInteger:
                now_page = pages.page(pages.num_pages)
            except InvalidPage:
                now_page = pages.page(1)
            context.update({'now_page': now_page, 'pages': pages})
            response = render(request, 'school/org-list-content.html', context)
            result = response.content.decode('utf-8')                           # response对象的content属性为utf8编码的
            return JsonResponse({'result': result})                            # 字符串，需要解码为unicode
        else:
            city_list = City.objects.all()
            org_order = Org.objects.all().order_by('click')[:3]
            org_count = Org.objects.all().count()
            context.update({'city_list': city_list, 'org_order': org_order, 'org_count': org_count})
            return render(request, 'school/org-list.html', context)


# 机构详情视图，get判断是否ajax返回模板页面或页面内容
class OrgDetailView(View):
    @classmethod
    def get(cls, request, org_id, index=0):
        # get请求时返回通用页面
        try:
            org = Org.objects.get(pk=org_id)
        except Org.DoesNotExist:
            return redirect('org_list')
        # 用户是否收藏此机构，未登录为未收藏
        if request.user.is_authenticated():
            try:
                UserCollection.objects.get(user=request.user, type=1, collet_id=org_id)
            except UserCollection.DoesNotExist:
                collect_status = 0
            else:
                collect_status = 1
        else:
            collect_status = 0
        # 更新点击量,经典课程和课程总数
        org.click_update()
        org.update_org_course()
        org.get_course_num()
        # 计算推荐指数
        if org.click > 500:
            org_level = round(org.collection/org.click, 1)*5
        else:
            org_level = 5.0
        context = {'title': ''.join(['机构首页-', org.name]),
                   'org': org,
                   'org_level': org_level,
                   'collect_status': collect_status}
        if request.user.is_authenticated():
            user = request.user
            # 查询有无此条收藏数据
            try:
                is_collect = UserCollection.objects.get(user=user, type=3, collet_id=org_id)
            except UserCollection.DoesNotExist:
                collect_status = '收藏'
            else:
                collect_status = '已收藏'
            context.update({'collect_status': collect_status})
        else:
            context.update({'collect_status': '收藏'})
        response = render(request, 'school/base-org.html', context)
        return response

    @classmethod
    def post(cls, request, org_id, index=0):
        context = {}
        # 请求是ajax时返回请求对应的内容
        if request.is_ajax():
            try:
                org = Org.objects.get(id=org_id)
            except Org.DoesNotExist:
                return redirect('org_list')
            html = ['school/org-detail-homepage.html', 'school/org-detail-course.html',
                    'school/org-detail-desc.html', 'school/org-detail-teachers.html']
            try:
                index = int(index)
            except:
                index = 0
            # 根据index，决定模板和上下文内容
            all_course = Course.objects.select_related('teacher__school').filter(teacher__school_id=org_id).order_by(
                'collection_num')
            all_teacher = Teacher.objects.filter(school_id=org_id).order_by('collection_num')
            org_desc = org.desc
            if index == 0:
                context.update({'all_course': all_course, 'all_teacher': all_teacher, 'org_desc': org_desc, 'org': org})
            elif index == 1:
                context.update({'all_course': all_course, 'org': org})
            elif index == 2:
                context.update({'org_desc': org_desc, 'org': org})
            elif index == 3:
                context.update({'all_teacher': all_teacher, 'org': org})
            response = render(request, html[index], context)
            content = response.content.decode('utf-8')
            return JsonResponse({'content': content})


# 教师列表视图
def teacher_list(request):
    if request.method == 'GET':
        all_teacher = Teacher.objects.all().order_by('collection_num')
        count = all_teacher.count()
        p = Paginator(all_teacher, 1, request=request)
        now_page = p.page(1)
        context = {'title': '课程讲师', 'paginator': p, 'now_page': now_page, 'count': count, 'all_teacher': all_teacher}
        return render(request, 'school/teachers-list.html', context)
    elif request.method == 'POST':
        if request.is_ajax():
            order_type = ['collection_num', 'click']
            order = int(request.POST.get('order', 0))
            page = int(request.POST.get('page', 1))
            all_teacher = Teacher.objects.all().order_by(order_type[order])
            p = Paginator(all_teacher, 1, request=request)
            try:
                now_page = p.page(page)
            except InvalidPage:
                now_page = p.page(1)
            # result = {'status': 200, 'object_list': []}
            # for teacher in now_page.object_list:
            #     object_info = {}
            #     object_info.update({
            #         'worked_year': teacher.worked_year,
            #         'job': teacher.job,
            #         'school': teacher.school,
            #         'collection_num': teacher.collection_num,
            #         'pointer': teacher.pointer,
            #         'get_course_num': teacher.get_course_num
            #     })
            #     result['object_list'].append(object_info)
            context = {'all_teacher': now_page.object_list}
            response_content = render(request, 'school/teacher-list-content.html', context).content.decode('utf-8')
            return JsonResponse({'content': response_content})


class TeacherDetailView(View):
    # get请求返回教师详情页
    @classmethod
    def get(cls, request, teacher_id):
        try:
            teacher = Teacher.objects.get(id=teacher_id)
        except Teacher.DoesNotExist:
            return redirect('teacher_list')
        teacher.update_click()
        org = teacher.school
        org_teachers = org.teacher_set.all()
        cources = teacher.course_set.all()
        teacher_name = teacher.name
        # 查询是否已收藏该教师和该机构
        if request.user.is_authenticated():
            try:
                UserCollection.objects.get(user=request.user, type=1, collet_id=org.id)
            except UserCollection.DoesNotExist:
                org_collect_text = '收藏'
            else:
                org_collect_text = '已收藏'
            try:
                UserCollection.objects.get(user=request.user, type=2, collet_id=teacher.id)
            except UserCollection.DoesNotExist:
                teacher_collect_text = '收藏'
            else:
                teacher_collect_text = '已收藏'
        else:
            org_collect_text = '收藏'
            teacher_collect_text = '收藏'
        context = {'title': ''.join(['讲师详情-', teacher_name]),
                   'teacher': teacher,
                   'org': org, 'cources': cources,
                   'org_teachers': org_teachers,
                   'org_collect_text': org_collect_text,
                   'teacher_collect_text': teacher_collect_text
                   }
        return render(request, 'school/teacher-detail.html', context)

