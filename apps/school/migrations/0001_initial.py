# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-01-08 11:21
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('course', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='城市名')),
                ('add_time', models.DateField(auto_now_add=True, verbose_name='添加时间')),
            ],
            options={
                'verbose_name': '城市信息',
                'verbose_name_plural': '城市信息',
            },
        ),
        migrations.CreateModel(
            name='Org',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='名称')),
                ('tab', models.IntegerField(choices=[(1, '培训机构'), (2, '高校'), (3, '组织或个人')], default=1, verbose_name='机构类别')),
                ('pic', models.ImageField(default='school/bjdx.jpg', upload_to='school/%Y/%m', verbose_name='封面')),
                ('desc', models.CharField(default='全国知名', max_length=200, verbose_name='机构简介')),
                ('introduce', models.TextField(default='', verbose_name='机构介绍')),
                ('addr', models.CharField(blank=True, max_length=50, null=True, verbose_name='详细地址')),
                ('click', models.IntegerField(default=0, verbose_name='点击量')),
                ('collection', models.IntegerField(default=0, verbose_name='收藏数')),
                ('course_num', models.IntegerField(default=0, verbose_name='课程数')),
                ('add_time', models.DateField(auto_now_add=True, null=True, verbose_name='添加时间')),
                ('city', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='school.City', verbose_name='所在城市')),
                ('main_course_1', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='main_course_1', to='course.Course', verbose_name='经典课程1')),
                ('main_course_2', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='main_course_2', to='course.Course', verbose_name='经典课程2')),
            ],
            options={
                'verbose_name': '教学机构',
                'verbose_name_plural': '教学机构',
                'ordering': ('click',),
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='姓名')),
                ('pic', models.ImageField(default='/media/teacher/default_middile_2_WZ1559E.png', upload_to='teacher/%Y/%m', verbose_name='头像')),
                ('job', models.CharField(max_length=50, verbose_name='职位')),
                ('worked_year', models.CharField(blank=True, default='1', max_length=20, null=True, verbose_name='教学时间')),
                ('pointer', models.CharField(max_length=100, verbose_name='教学特点')),
                ('collection_num', models.IntegerField(default=0, verbose_name='收藏数')),
                ('click', models.IntegerField(default=0, verbose_name='点击量')),
                ('add_time', models.DateField(auto_now_add=True, verbose_name='添加时间')),
                ('school', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='school.Org', verbose_name='所属机构')),
            ],
            options={
                'verbose_name': '讲师信息',
                'verbose_name_plural': '讲师信息',
            },
        ),
    ]
