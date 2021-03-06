# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-01-17 14:33
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0004_auto_20180117_1118'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='chapter',
            options={'verbose_name': '章节信息', 'verbose_name_plural': '章节信息'},
        ),
        migrations.AlterModelOptions(
            name='course',
            options={'ordering': ['click'], 'verbose_name': '所有课程', 'verbose_name_plural': '所有课程'},
        ),
        migrations.AlterModelOptions(
            name='video',
            options={'verbose_name': '课程视频', 'verbose_name_plural': '课程视频'},
        ),
        migrations.RenameField(
            model_name='chapter',
            old_name='Course',
            new_name='course',
        ),
        migrations.RenameField(
            model_name='resources',
            old_name='Course',
            new_name='course',
        ),
        migrations.RenameField(
            model_name='video',
            old_name='Chapter',
            new_name='chapter',
        ),
    ]
