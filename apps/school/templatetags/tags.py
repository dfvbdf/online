from django import template
from course.models import Course

register = template.Library()


@register.filter
def get_org_course(model, index):
    num = int(index)
    course_list = Course.objects.select_related('teacher__school').filter(teacher__school=model)
    if not course_list:
        course_list = ['暂无课程', '暂无课程']
    return course_list[num]


@register.filter
def list_index(li, num):
    return li[int(num)]


register.filter('org_course', get_org_course)
register.filter('list_index', list_index)


