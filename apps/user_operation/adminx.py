import xadmin
from .models import StudyCourse, UserCollection, UserConsult, UserComment, UserMessage, PublicMessage


class StudyCourseAdmin(object):
    list_display = ['user', 'course']
    list_filter = ['user', 'course']
    list_pre_page = 20


class UserCommentAdmin(object):
    list_display = ['user', 'course']
    list_filter = ['user', 'course']
    list_pre_page = 20


class UserMessageAdmin(object):
    list_display = ['send_user', 'recv_user', 'has_read', 'add_time']
    list_filter = ['send_user', 'has_read', 'has_read', 'add_time']
    list_pre_page = 20


class PublicMessageAdmin(object):
    list_display = ['recv_user', 'add_time']
    list_filter = ['recv_user', 'has_read', 'has_read', 'add_time']
    list_pre_page = 20


class UserConsultAdmin(object):
    list_display = ['name', 'course', 'tell', 'add_time']
    list_filter = ['name', 'course', 'tell', 'add_time']
    list_pre_page = 20


xadmin.site.register(StudyCourse, StudyCourseAdmin)
xadmin.site.register(UserComment, UserCommentAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(PublicMessage, PublicMessageAdmin)
xadmin.site.register(UserConsult, UserConsultAdmin)