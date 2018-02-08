from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view

from school.models import Org, Teacher


class TeacherSerializer(serializers.ModelSerializer):            # 定义序列化器，指定模型类与字段名
    class Meta:
        model = Teacher
        fields = '__all__'


@api_view(['GET'])                                              # 装饰器指定请求方式,是一个列表
def school_list(request):
    school_list = Teacher.objects.all()                             # 获取数据
    serializer = TeacherSerializer(school_list, many=True)           # 传入对象列表(<queryset对象>），用序列化器序列化为dict
    return Response(serializer.data)  # 返回json
