import xadmin
from .models import Course, Chapter, CourseTab, Resources, Video


class CourseTabAdmin(object):
    list_display = ['name', 'add_time']
    search_fields = ['name']
    list_filter = ['name']
    list_pre_page = 20


class CourseAdmin(object):
    list_display = ['name', 'tab', 'level', 'study_num', 'collection_num', 'click', 'get_chapter']
    search_fields = ['name', 'tab__name']
    list_filter = ['name', 'tab__name']
    list_pre_page = 20
    readonly_fields = ['add_time']
    # 图表
    data_charts = {
        "click_count": {'title': "用户点击统计", "x-field": "add_time", "y-field": ("click",),
                        "order": ('add_time',)},
        "collect_count": {'title': "用户收藏统计", "x-field": "add_time", "y-field": ("collection_num",),
                          "order": ('add_time',)}
    }


class ChapterAdmin(object):
    list_display = ['name', 'add_time']
    search_fields = ['name']
    list_filter = ['name']
    list_pre_page = 20


class ResourcesAdmin(object):
    list_display = ['name', 'course', 'add_time']
    search_fields = ['name', 'course__name']
    list_filter = ['name', 'course__name']
    list_pre_page = 20


class VideoAdmin(object):
    list_display = ['name', 'chapter', 'add_time']
    search_fields = ['name', 'chapter__name']
    list_pre_page = 20


xadmin.site.register(CourseTab, CourseTabAdmin)
xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Chapter, ChapterAdmin)
xadmin.site.register(Resources, ResourcesAdmin)
xadmin.site.register(Video, VideoAdmin)