import random
from online2.settings import HOST, PORT

from online2.settings import HOST, PORT
from user.models import EmailVerifyRecord
from django.core.mail import EmailMultiAlternatives
from django.db.models import Q


def make_random_code():                         # 用于生成6位随机字符串
    random_code = ''
    for i in range(6):
        random_code += str(random.choice(range(10)))
    return random_code


def active_email(email, send_type=1):
    # 构建邮件对象并保存到数据库
    email_obj = EmailVerifyRecord()
    email_obj.code = make_random_code()
    email_obj.email = email
    email_obj.send_type = send_type
    # 如果已有此类型的邮件验证码，则更新验证码，没有则创建对象
    try:
        old_email = EmailVerifyRecord.objects.get(Q(email=email_obj.email), Q(send_type=email_obj.send_type))
    except EmailVerifyRecord.DoesNotExist:
        email_obj.save()
    else:
        old_email.code = email_obj.code
        old_email.save()
    # 邮件的其他设置
    from_email = '在线学习平台 <17853323597@163.com>'
    to = email_obj.email
    if send_type == 1:
        subject = '用户账户激活'
        text_content = '点击链接以激活您的账户'
        url = HOST+PORT+'/user_active/%s/%s/%d' % (email_obj.email, email_obj.code, send_type)
        html_content = "<b style='color:yellow;'><a href='%s'>%s</a></b>" % \
                       (url, '点击以激活您的账户')
    else:
        subject = '密码找回'
        text_content = '重新设置您的密码'
        url = HOST+PORT+'/reset_password/%s/%s/%d' % (email_obj.email, email_obj.code, send_type)
        html_content = "<b style='color:yellow;'><a href='%s'>%s</a></b>" % \
                       (url, '点击以重新设置您的密码')
    # 创建邮件并发送
    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, 'text/html')
    msg.send()
