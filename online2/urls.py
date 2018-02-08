"""online URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
# from django.contrib import admin
from django.views.static import serve
from online2.settings import MEDIA_ROOT
from django.conf import settings
from django.conf.urls.static import static

import xadmin
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter

from user_operation.views import IndexView
from user_operation.views import page_not_found, page_error, permission_denied
from api import school_list
from course.apiview import CourseListViewSet

router = DefaultRouter()
# 配置course的url
router.register(r'courses', CourseListViewSet)

urlpatterns = [
    url(r'^api/schools/$', school_list),                            # api
    # url(r'^api/courses/$', course_list),                        # 课程列表
    url(r'^api/', include(router.urls)),                        # 包含到router中

    url(r'docs/', include_docs_urls(title='在线学习平台')),               # api文档
    url(r'api-auth/', include('rest_framework.urls', namespace='rest_framework')),  # api用户登录


    url(r'^$', IndexView.as_view(), name='index'),  # 主页
    url(r"^media/(?P<path>.*)/$", serve, {'document_root': MEDIA_ROOT}),  # 用户上传媒体资源的保存地址
    url(r'^static/(?P<path>.*)/$', serve, {'document_root': settings.STATIC_ROOT}), # 静态资源url地址
    url(r'^course/', include('course.urls')),                          # 课程
    url(r'^user_operation/', include('user_operation.urls')),       # 用户操作
    url(r'^org/', include('school.urls')),                             # 课程机构
    url(r'^captcha/', include('captcha.urls')),                       # 验证码
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),          # 富文本编辑器
    url(r'^xadmin/', xadmin.site.urls),                                  # 后台
    url(r'^', include('user.urls')),                                      # 用户登录等
]

handler404 = page_not_found
handler403 = permission_denied
handler500 = page_error
