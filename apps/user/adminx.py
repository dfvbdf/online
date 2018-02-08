import xadmin
from xadmin import views
from .models import Banner


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "在线管理系统"  # 系统名称
    site_footer = "在线学习网"      # 底部版权栏
    menu_style = "accordion"     # 将菜单栏收起来


class BannerAdmin(object):
    list_display = ['name', 'index', 'add_time']


xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)
