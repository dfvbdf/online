# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-01-17 11:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0003_auto_20180116_1549'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='course',
            options={'ordering': ['click'], 'verbose_name': '课程', 'verbose_name_plural': '课程'},
        ),
        migrations.AddField(
            model_name='course',
            name='public_text',
            field=models.CharField(default='', max_length=50, verbose_name='课程公告'),
        ),
    ]
