# -*- coding: utf-8 -*-

import datetime

from django.conf import settings
from django.contrib.auth import login, logout
from django.contrib.auth.models import User
from django.db import transaction
from django.shortcuts import redirect, render, reverse

from account.models import Profile
from utils.errors import VeriCodeError, VerifyFailed, PasswordResetFailed, UserNotFound, VeriCodeTimeOut
from utils.redis.rprofile import get_signcode, get_passwd


def web_index(request):
    """
    首页渲染视图
    :param request:请求对象
    :return: 渲染视图并返回: user_info：用户信息;upgrade_info: 用户会员信息;has_login: 是否已登录;kinds: 比赛数据
    """

    uid = request.session.get('uid', '')

    try:
        profile = Profile.objects.get(uid=uid)
    except Profile.DoesNotExist:
        profile = None

    return render(request, 'web/index.html', {
        'user_info': profile and profile.data,
        'upgrade_info': profile and profile.upgrade_data,
        'has_login': bool(profile),
    })


def web_login(request):
    """
    登录页面渲染视图
    :param request: 请求对象
    :return: 渲染视图并返回: login_info: 用户登录所需配置信息;has_login:是否已经登录;user_info:用户信息;upgrade_info: 用户会员信息
    """

    uid = request.session.get('uid', '')

    if uid:
        try:
            profile = Profile.objects.get(uid=uid)
        except Profile.DoesNotExist:
            profile = None

        if profile:
            return render(request, 'web/index.html', {
                'user_info': profile and profile.data,
                'upgrade_info': profile and profile.upgrade_data,
                'has_login': bool(uid)
            })
        else:
            try:
                del request.session['uid']
            except KeyError:
                pass

    return render(request, 'web/login.html', {
        'login_info': settings.WXWEB_LOGIN_PARAMS or {},
        'has_login': False
    })


def web_logout(request):
    """
    用户注销视图
    :param request: 请求对象
    :return: 重定向首页
    """

    logout(request)

    try:
        del request.session['uid']
    except KeyError:
        pass

    return redirect(reverse('web_index'))


def signup_redirect(request):
    """

    :param request: 请求对象
    :return:emai邮箱地址，sign注册验证码
    """

    email = request.GET.get('email', '')
    sign = request.GET.get('sign', '')

    return render(request, 'web/sign_email.html', {
        'email': email,
        'sign': sign
    })


@transaction.atomic
def email_notify(request):
    email = request.GET.get('email', '')  # 获取要验证的邮箱
    sign = request.GET.get('sign', '')  # 获取校验码
    signcode = get_signcode(sign)  # 在redis校验邮箱
    if not signcode:
        return render(request, 'err.html', VeriCodeTimeOut)  # 校验失败返回错误视图
    if not (email == signcode.decode('utf-8')):
        return render(request, 'err.html', VeriCodeError)  # 校验失败返回错误视图
    try:
        user = User.objects.get(email=email)  # 获取用户
    except User.DoesNotExist:
        user = None
    if user is not None:  # 激活用户
        user.is_active = True
        user.is_staff = True
        user.save()
        login(request, user)  # 登录用户
        profile, created = Profile.objects.select_for_update().get_or_create(  # 配置用户信息
            name=user.username,
            email=user.email,
        )
        profile.user_src = Profile.NORMAL_USER  # 配置用户为普通登录用户
        profile.save()

        request.session['uid'] = profile.uid  # 配置session
        request.session['username'] = profile.name
        return render(request, 'web/index.html', {  # 渲染视图，并返回已登录信息
            'user_info': profile.data,
            'has_login': True,
            'msg': "激活成功",
        })
    else:
        return render(request, 'err.html', VerifyFailed)  # 校验失败返回错误视图

@transaction.atomic
def reset_notify(request):
    email = request.GET.get('email', '')
    sign = request.GET.get('sign', '')
    is_biz = request.GET.get('is_biz')

    password = get_passwd(sign)

    if not password:
        return render(request, 'err.html', PasswordResetFailed)

    try:
        u = User.objects.get(email=email)
    except User.DoesNotExist:
        return render(request, 'err.html', UserNotFound)

    if is_biz == '1':
        u.is_staff = True
        u.is_active = True
    u.set_password(password)
    u.save()

    return render(request, 'web/index.html', {
        'has_login': False,
        'msg': '密码修改成功!'
    })


def error(request):
    return render(request, 'err.html', {"errtitle": "页面发生错误", "errmsg": "页面发生未知错误，请联系管理员解决~"})
