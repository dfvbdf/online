from django.conf.urls import url
from .views import LoginView, RegisterView, ForgetpwdView, LogoutView, UserActive, test_check, ResetPasswordView, ResetPwdView

urlpatterns = [
    url(r'^login/$', LoginView.as_view(), name='login'),  # 登陆
    url(r'^logout/$', LogoutView.as_view(), name='logout'),  # 登出
    url(r'^register/$', RegisterView.as_view(), name='register'),  # 注册
    url(r'^test_check/$', test_check),  # 检查
    url(r'^user_active/(.*)/(.*)/(.*)/$', UserActive.as_view(), name='user_active'),  # 用户激活
    url(r'^forgetpwd/$', ForgetpwdView.as_view(), name='forgetpwd'),  # 忘记密码
    url(r'^reset_password/(.*)/(.*)/(.*)/$', ResetPasswordView.as_view(), name='reset_password'),  # 重设密码呈现
    url(r'^reset_pwd/$', ResetPwdView.as_view(), name='reset_pwd'),  # 重设密码提交
]