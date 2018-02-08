from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from .views import UserConsultView, CollectionView, ShowCommentView, UserCommentView
from user_operation.views import UserCenterView, ChangeUserInfoView
from user.views import login_check


urlpatterns = [
    url(r'^my_info/$', login_check(UserCenterView.as_view()), name='user_center'),           # 用户中心
    url(r'change_info/$', ChangeUserInfoView.as_view(), name='change_info'),   # 修改用户信息

    url(r'^user_consult/$', UserConsultView.as_view(), name='user_consult'),       # 用户咨询
    url(r'^collect/$', CollectionView.as_view(), name='collect'),  # 用户收藏/取消收藏
    url(r'^show_comment/$', ShowCommentView.as_view(), name='show_comment'),        # 呈现评论
    url(r'^user_comment/$', UserCommentView.as_view(), name='user_comment')          # 用户评论

]