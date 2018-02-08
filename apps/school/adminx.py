import xadmin
from xadmin import views

from .models import City, Teacher, Org


class CityAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = ['name']
    list_pre_page = 20


class SchoolAdmin(object):
    list_display = ['name', 'tab', 'click', 'collection_num', 'get_course_num']
    search_fields = ['name', 'city__name']
    list_filter = ['name', 'city__name']
    list_pre_page = 20


class TeacherAdmin(object):
    list_display = ['name', 'school', 'job']
    search_fields = ['name', 'school__name', 'job']
    list_filter = ['name', 'school__name']
    list_pre_page = 20


xadmin.site.register(City, CityAdmin)
xadmin.site.register(Org, SchoolAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
