from django.conf.urls import url
from .views import CourseListView, CourseDetailView, CourseStudyView, CourseChapterView

urlpatterns = [
    url(r'^course_list/(?P<order>\d?)/?(?P<page>\d?)/?$', CourseListView.as_view(), name='course_list'),    # 课程列表
    url(r'^course_detail/(?P<pk>\d+)/$', CourseDetailView.as_view(), name='course_detail'),      # 课程详情
    url(r'^course_study/(?P<pk>\d+)/$', CourseStudyView.as_view(), name='course_study'),            # 课程学习
    url(r'^course_chapter/$', CourseChapterView.as_view(), name='course_chapter'),                  # 章节信息
]
