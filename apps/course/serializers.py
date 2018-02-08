from rest_framework import serializers
from .models import Course, CourseTab
from django.views.generic.list import ListView


# 课程api
class CourseSerializer(serializers.Serializer):
    name = serializers.CharField(required=True, max_length=100)
    pic = serializers.ImageField(read_only=True)

    def create(self, validated_data):           # 重写create方法
        return Course.objects.create(**validated_data)


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        from school.models import Teacher
        model = Teacher
        fields = '__all__'


class CourseTabSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseTab
        fields = '__all__'


class CourseModelSerializer(serializers.ModelSerializer):
    teacher = TeacherSerializer()
    tab = CourseTab()

    class Meta:
        model = Course
        fields = '__all__'
