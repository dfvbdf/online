from django import forms
from captcha.fields import CaptchaField                         # 导入验证码字段


class UserLoginForm(forms.Form):
    username = forms.CharField(max_length=50, min_length=4, required=True, error_messages={'required': '用户名是必填字段'})
    password = forms.CharField(required=True, min_length=6, error_messages={'required': '密码是必填字段'})


class UserRegisterForm(forms.Form):
    username = forms.CharField(required=True, min_length=2, error_messages={'required': '请输入您的用户名'})
    email = forms.EmailField(required=True, error_messages={'required': '请设置您的邮箱'})
    password = forms.CharField(required=True, max_length=20, min_length=6,
                               error_messages={'required': '请设置您的密码', 'invalid': '密码应为6-20位'})
    captcha = CaptchaField(required=True, error_messages={'required': '请输入验证码'})      # 验证码字段

    def clean_username(self):
        username = self.cleaned_data['username']
        if username == 'dfvbdf13':
            raise forms.ValidationError('姓名不能为dfvbdf13')
        return username


class ForgetPwdForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={'required': '请输入您的邮箱'})
    captcha = CaptchaField(required=True, error_messages={'required': '请输入验证码'})


class ResetPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=6, max_length=20,
                                error_messages={'required': '密码不能为空', 'invalid': '密码应为6-20位'})
    password2 = forms.CharField(required=True, min_length=6, max_length=20,
                                error_messages={'required': '密码不能为空', 'invalid': '密码应为6-20位'})