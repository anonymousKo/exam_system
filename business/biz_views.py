# -*- coding: utf-8 -*-

from django.contrib.auth.models import User
from django.conf import settings
from django.db import transaction
from django.views.decorators.csrf import csrf_exempt

from account.models import Profile
from business.models import BusinessAccountInfo

from utils.response import json_response
from utils.errors import BizError, UserError


def check_biz(request):
    email = request.GET.get('email', '')  # 获取邮箱
    try:  # 检查数据库中是否由该邮箱注册过的数据
        biz = BusinessAccountInfo.objects.get(email=email)
    except BusinessAccountInfo.DoesNotExist:
        biz = None
    return json_response(200, 'OK', {  # 返回是否已经被注册过和是否已经有此用户
        'userexists': User.objects.filter(email=email).exists(),
        'bizaccountexists': bool(biz)
    })


@csrf_exempt
@transaction.atomic
def registry_biz(request):
    email = request.POST.get('email', '')  # 获取填写的邮箱
    name = request.POST.get('name', '')  # 获取填写的机构名
    username = request.POST.get('username', '')  # 获取填写的机构联系人
    phone = request.POST.get('phone', '')  # 获取填写的手机号
    ctype = request.POST.get('type', BusinessAccountInfo.INTERNET)  # 获取机构类型
    flag = int(request.POST.get('flag', 2))  # 获取一个标记位，代表用户是创建新用户还是使用绑定老用户的方式
    uname = email.split('@')[0]  # 和之前的注册逻辑没什么区别，创建一个账户名
    if not User.objects.filter(username__exact=name).exists():
        final_name = username
    elif not User.objects.filter(username__exact=uname).exists():
        final_name = uname
    else:
        final_name = email
    if flag == 2:  # 如果标记位是2，那么将为他创建新用户
        user = User.objects.create_user(
            username=final_name,
            email=email,
            password=settings.INIT_PASSWORD,
            is_active=False,
            is_staff=False
        )
    if flag == 1:  # 如果标记位是1，那么为他绑定老用户
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return json_response(*UserError.UserNotFound)
    pvalues = {
        'phone': phone,
        'name': final_name,
        'user_src': Profile.COMPANY_USER,
    }
    profile, _ = Profile.objects.select_for_update().get_or_create(email=email)  # 获取或创建用户信息
    for k, v in pvalues.items():
        setattr(profile, k, v)
    profile.save()
    bizvalues = {
        'company_name': name,
        'company_username': username,
        'company_phone': phone,
        'company_type': ctype,
    }
    biz, _ = BusinessAccountInfo.objects.select_for_update().get_or_create(  # 获取或创建机构账户信息
        email=email,
        defaults=bizvalues
    )
    return json_response(200, 'OK', {  # 响应JSON格式数据，这个标记位在发送验证邮件的时候还有用
        'name': final_name,
        'email': email,
        'flag': flag
    })
