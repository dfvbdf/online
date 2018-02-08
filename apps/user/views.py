from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.views.generic.base import View
from django.contrib import auth
from django.contrib.auth.models import User
from django.contrib.auth.backends import ModelBackend               # django默认的用户登录处理类
from django.db.models import Q
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required

from .forms import UserLoginForm, UserRegisterForm, ForgetPwdForm, ResetPwdForm
from .models import UserInfo, EmailVerifyRecord
from email_handle.send_email import active_email


# 用户登录检查装饰器
def login_check(func):
    def handle(request, *args, **kwargs):
        if request.user.is_authenticated():
            return func(request, *args, **kwargs)
        # 用户未登录时将用户重定向到登录页面，并记录本次请求地址到cookie
        else:
            response = redirect('login')
            response.set_cookie('refer_url', request.get_full_path())
            return response
    return handle


# 用户登录审查视图
class UserLoginCheck(ModelBackend):                         # 继承用户登录处理类modelbackend
    def authenticate(self, request, username=None, password=None, **kwargs):       # 重写authenticate方法
        try:
            user = UserInfo.objects.get(Q(username=username) | Q(email=username))
        except UserInfo.DoesNotExist:
            return None
        else:
            if user.check_password(password):               # 调用django的检查密码方法
                return user                                 # 返回user对象


# 用户登录视图
class LoginView(View):
    context = {'title': '用户登录'}

    @classmethod
    def get(cls, request):
        return render(request, 'user/login.html', cls.context)

    @classmethod
    def post(cls, request):
        user_check_form = UserLoginForm(request.POST)
        if user_check_form.is_valid():                                 # 用户输入合法的话
            username = user_check_form.cleaned_data['username']
            password = user_check_form.cleaned_data['password']
            # 调用自定义的authenticate方法
            user = auth.authenticate(username=username, password=password)
            if user:                                                    # 认证用户的账号密码
                if user.is_active:                                      # 用户未冻结重定向到跳转来之前的url
                    auth.login(request, user)
                    url = request.COOKIES.get('refer_url', '/')
                    return redirect(url)
                else:
                    cls.context.update({'msg': '该用户未激活,请检查您的邮箱以激活账户', 'username': username})
                    response = render(request, 'user/login.html', cls.context)
                    response.set_cookie('is_login', 1)
                    return response
            else:                                                       # 认证失败
                cls.context.update({'msg': '用户未注册或密码错误!', 'username': username})
                return render(request, 'user/login.html', cls.context)
        else:
            errors = user_check_form.errors                                # 用户输入不合法，返回表单错误
            cls.context.update({'errors': errors})
            return render(request, 'user/login.html', cls.context)


class LogoutView(View):                             # 处理登出，调用django自带函数,重定向到首页
    @classmethod
    def get(cls, request):
        auth.logout(request)
        response = redirect('index')
        response.set_cookie('is_login', '0')
        return response


class RegisterView(View):                                   # 处理用户注册

    @classmethod
    def get(cls, request):
        context = {'title': '用户注册'}
        # 返回form中验证码字段渲染的模板
        register_form = UserRegisterForm()
        context.update({'captcha': register_form['captcha']})
        return render(request, 'user/register.html', context)

    @classmethod
    def post(cls, request):
        if request.is_ajax():
            context = {}
            register_form = UserRegisterForm(request.POST)
            # 用户输入是否合法
            if register_form.is_valid():
                data = register_form.cleaned_data
                username = register_form.cleaned_data['username']
                email = register_form.cleaned_data['email']
                password = register_form.cleaned_data['password']
                # 验证是否已有用户名
                user_set = UserInfo.objects.filter(username=username)
                if user_set:
                    context.update({'errors':{'msg': '用户名已被注册！'}, 'status': 0})
                    return JsonResponse(context)
                # 验证邮箱是否已注册
                email_set = UserInfo.objects.filter(email=email)
                if email_set:
                    context.update({'errors':{'msg': '该邮箱已被注册！'}, 'status': 0})
                    return JsonResponse(context)

                # 创建新账户并设为冻结，让用户点击邮件激活
                user = UserInfo.objects.create(username=username, email=email)
                user.set_password(password)
                user.is_active = False
                user.save()
                # 调用发送注册验证码的函数
                active_email(email, 1)
                context.update({'status': 1})
                return JsonResponse(context)
            else:
                # 输入不合法时返回表单错误
                errors = register_form.errors
                context.update({'errors': errors, 'status': 0})
                return JsonResponse(context)
        else:
            return redirect('index')


# 忘记密码页面呈现视图
class ForgetpwdView(View):
    context = {'title': '忘记密码'}

    @classmethod
    def get(cls, request):
        form = ForgetPwdForm()
        cls.context.update({'captcha': form['captcha']})
        return render(request, 'user/forgetpwd.html', cls.context)

    @classmethod
    def post(cls, request):
        check_form = ForgetPwdForm(request.POST)
        if check_form.is_valid():
            email = check_form.cleaned_data['email']
            # 如果用户信息中没有此邮箱则返回状态码1，否则返回0
            if UserInfo.objects.filter(email=email):
                result = {'status': 0}
                active_email(email, 2)
            else:
                result = {'status': 1}
            return JsonResponse(result)
        # 邮箱格式不正确返回状态码1
        elif not check_form.cleaned_data['email']:
            result = {'status': 1}
            return JsonResponse(result)
        # 验证码不正确返回状态码2
        else:
            result = {'status': 2}
            return JsonResponse(result)


# 重设密码视图
class ResetPasswordView(View):
    context = {'title': '密码重设'}

    @classmethod
    def get(cls, request, email, random_code, send_type):
        # 验证是否有此邮箱
        try:
            register_email_obj = EmailVerifyRecord.objects.get(Q(email=email), Q(send_type=send_type))
        except UserInfo.DoesNotExist:
            return redirect('index')

        # 验证通过将email写入cookie，返回重设密码页面，否则重定向到首页
        if register_email_obj.code == random_code:
            response = render(request, 'user/password_reset.html', cls.context)
            response.set_cookie('email', email)
            return response
        else:
            return redirect('index')


# 重设密码视图
class ResetPwdView(View):
    @classmethod
    def post(cls, request):
        reset_from = ResetPwdForm(request.POST)
        pwd1 = request.POST.get('password1', '')
        pwd2 = request.POST.get('password2', '')
        if reset_from.is_valid():
            if pwd1 == pwd2:
                email = request.COOKIES.get('email', '')
                if email:
                    user = UserInfo.objects.get(email=email)
                    user.set_password(pwd1)
                    user.is_active = True
                    user.save()
                    auth.login(request, user)
                    return JsonResponse({'status': 0, 'url': reverse('usercenter')})
                else:
                    return JsonResponse({'status': 1, "error": '您可能禁用了浏览器cookie功能，无非对你完成验证'})
            else:
                return JsonResponse({'status': 1, "error": '两次输入密码不一致,请检查密码'})
        else:
            return JsonResponse({'status': 1, "error": reset_from.errors.get('password1', '')})


# 激活用户视图
class UserActive(View):

    @classmethod
    def get(cls, request, email, random_code, send_type):
        # 验证是否有此邮箱
        try:
            register_email_obj = EmailVerifyRecord.objects.get(Q(email=email), Q(send_type=send_type))
        except UserInfo.DoesNotExist:
            return redirect('index')
        # 验证通过激活用户并登陆，重定向到用户中心,否则重定向到首页
        if register_email_obj.code == random_code:
            user = UserInfo.objects.get(email=email)
            user.is_active = True
            auth.login(request, user)
            return redirect('user_center')
        else:
            return redirect('index')


def test_check(request):
    active_email('1028195694@qq.com', 1)
    return HttpResponse('邮件发送成功！')

