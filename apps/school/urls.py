from django.conf.urls import url
from .views import OrgListView, OrgDetailView, teacher_list, TeacherDetailView

urlpatterns = [
    url(r'^org_list/(?P<page>\d*)/*$', OrgListView.as_view(), name='org_list'),          # 机构列表
    url(r'^org_detail/(?P<org_id>\d+)/(?P<index>\d+)/$', OrgDetailView.as_view(), name='org_detail'),      # 机构详情
    url(r"^teacher_list/$", teacher_list, name='teacher_list'),                              # 教师列表
    url(r'^teacher_detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name='teacher_detail')           # 教师详情
]