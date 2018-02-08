from celery import Celery
app = Celery('邮件提醒')
app.config_from_object('celery_app.celery_configs')
