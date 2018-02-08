from django.utils.deprecation import MiddlewareMixin


class IpCheck(MiddlewareMixin):
    @classmethod
    def process_request(cls, request):
        request_url = request.path
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']
        print('{ip}-{host}请求了{url}页面'.format(ip=ip, url=request_url, host=request.META['REMOTE_HOST']))
        print('用户代理 is '+request.META['HTTP_USER_AGENT'])
        print('登录用户' if request.user.is_authenticated()else '游客访问')
