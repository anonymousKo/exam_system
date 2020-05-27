# -*- coding: utf-8 -*-

import time

from django.shortcuts import render
from django.contrib.auth.models import User

from business.models import BusinessAccountInfo
from account.models import Profile


def home(request):
    uid = request.GET.get('uid', '') # 获取uid
    try:
        profile = Profile.objects.get(uid=uid)  # 根据uid获取用户信息
    except Profile.DoesNotExist:
        profile = None  # 未获取到用户信息profile变量置空
    types = dict(BusinessAccountInfo.TYPE_CHOICES)  # 所有的机构类型
    return render(request, 'bussiness/index.html', {  # 渲染视图，返回机构类型和是否存在该账户绑定过的机构账户
        'types': types,
        'is_company_user': bool(profile) and (profile.user_src == Profile.COMPANY_USER)
    })

def notify(request):
    email = request.GET.get('email', '')
    bind = request.GET.get('bind', '')

    time.sleep(.6)

    try:
        biz = BusinessAccountInfo.objects.get(email=email)
    except BusinessAccountInfo.DoesNotExist:
        biz = None

    try:
        profile = Profile.objects.get(email=email)
    except Profile.DoesNotExist:
        profile = None

    try:
        user = User.objects.get(email=email)
    except User.DoesNotExist:
        user = None

    return render(request, 'bussiness/result.html', {
        'is_registered': bool(biz) and bool(profile) and bool(user),
        'bind': bind
    })