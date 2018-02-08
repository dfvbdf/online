from django import forms
from .models import UserConsult
from user.models import UserInfo


# 用户咨询
class UserConsultForm(forms.ModelForm):
    class Meta:
        model = UserConsult
        fields = ['name', 'tell', 'course']


# 更改头像
class UserUploadPicForm(forms.ModelForm):
    class Meta:
        model = UserInfo
        fields = ['pic']


# 更新用户信息
class ChangeUserInfoForm(forms.ModelForm):
    # nickname = forms.CharField(max_length=50)
    # birthday = forms.DateField()
    # gender = forms.IntegerField()
    # address = forms.CharField(max_length=200)
    # tell = forms.CharField(max_length=11)
    class Meta:
        model = UserInfo
        fields = ['nickname', 'birthday', 'gender', 'address', 'tell']