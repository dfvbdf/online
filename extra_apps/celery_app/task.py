from extra_apps.celery_app import app

@app.task
def hello(arg):
    print(arg)