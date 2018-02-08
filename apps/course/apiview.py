from rest_framework.response import Response
from rest_framework import status, filters
from rest_framework import mixins
from rest_framework import generics
from rest_framework.pagination import PageNumberPagination
from rest_framework import viewsets
from django_filters.rest_framework import DjangoFilterBackend
import django_filters

from course.models import Course
from .serializers import CourseSerializer, CourseModelSerializer


class PaginationClass(PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    page_query_param = 'page'
    max_page_size = 100

class CourseFilter(django_filters.rest_framework.FilterSet):
    click = django_filters.NumberFilter(name='click', lookup_expr='lte')
    name = django_filters.CharFilter(name='name', lookup_expr='contains')

    class Meta:
        model = Course
        fields = ['click', 'name']
#
class CourseListView(generics.ListAPIView):
    '''所有课程'''
    queryset = Course.objects.all()
    serializer_class = CourseModelSerializer
    #pagination_class = PaginationClass

    def post(self, request):
        course_serializer = CourseSerializer(data=request.data)
        if course_serializer.is_valid():
            course_serializer.save()
            return Response(course_serializer.data, status=status.HTTP_201_CREATED)
        return Response(course_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CourseListViewSet(mixins.CreateModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet):
    """所有课程"""
    queryset = Course.objects.all()
    serializer_class = CourseModelSerializer
    pagination_class = PaginationClass
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)        # 使用过滤器
    #filter_fields = ('tab', 'teacher')                          # 指定过滤字段
    filter_class = CourseFilter
    search_fields = ('name', )                 # 搜索字段
    ordering_fields = ('id', )                   # 排序字段




