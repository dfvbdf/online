from datetime import timedelta
from celery.schedules import crontab

# 消息中间件
BROKER_URL = 'redis://127.0.0.1:6379'
# 结果存储
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/0'
# 时区
CELERY_TIMEZONE = 'Asia/Shanghai'
# 任务模块
CELERY_IMPORTS = (
    'celery_app.task'
)
# 设定任务函数配置
CELERYBEAT_SCHEDULE = {
    'every_10secondes':{
        'task': 'celery_app.task.hello',
        'schedule': timedelta(seconds=10),
        'args': ('hello celery!')
    }
}