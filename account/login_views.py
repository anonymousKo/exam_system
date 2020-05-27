# -*- coding: utf-8 -*-

import base64
import uuid
from io import BytesIO

from django.conf import settings
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.db import transaction
from django.shortcuts import redirect
from django.views.decorators.csrf import csrf_exempt

from account.models import Profile
from furl import furl
from utils.codegen import get_pic_code
from utils.errors import UserError
from utils.redis.extensions import quote, unquote
from utils.redis.rprofile import (get_vcode, set_profile, set_signcode,
                                  set_vcode, set_passwd, set_has_sentemail, get_has_sentemail,
                                  set_has_sentregemail, get_has_sentregemail)
from utils.response import json_response
from utils.wechat_utils import AUTHORIZE_URI, get_access_info, get_userinfo


def quote_state(state):
    return quote(state)


def unquote_state(request, state):
    if state == 'wxweblogin':
        return settings.WEB_INDEX_URI
    return unquote(state, buf=True) or ''


@transaction.atomic
def login_redirect(request):
    """
    微信登录重定向
    :param request: 请求对象
    :return: 获取用户信息并跳转回redirect_uri
    """

    code = request.GET.get('code', '')
    state = request.GET.get('state', '')

    state = unquote_state(request, state)

    access_info = get_access_info(settings.WXWEB_LOGIN_PARAMS.get('appid', ''), settings.WXWEB_LOGIN_PARAMS.get('appsecret', ''), code)
    if 'errcode' in access_info:
        return redirect(AUTHORIZE_URI.format(settings.WXWEB_LOGIN_PARAMS.get('appid'), settings.WEB_LOGIN_REDIRECT_URI, 'snsapi_userinfo', state))

    userinfo = get_userinfo(access_info.get('access_token', ''), access_info.get('openid', ''))
    if 'openid' not in userinfo:
        return redirect(AUTHORIZE_URI.format(settings.WXWEB_LOGIN_PARAMS.get('appid'), settings.WEB_LOGIN_REDIRECT_URI, 'snsapi_userinfo', state))

    profile_values = {
        'openid': userinfo.get('openid', ''),
        'user_src': 1,
        'sex': userinfo.get('sex', 0),
        'nickname': userinfo.get('nickname', ''),
        'avatar': userinfo.get('headimgurl', ''),
        'country': userinfo.get('country', ''),
        'province': userinfo.get('province', ''),
        'city': userinfo.get('city', ''),
    }

    profile, created = Profile.objects.select_for_update().get_or_create(openid=userinfo.get('openid', ''), defaults=profile_values)
    if not profile.unionid:
        profile.unionid = userinfo.get('unionid', '')
        profile.save()

    if not created:
        for key, value in profile_values.items():
            setattr(profile, key, value)
        profile.save()

    set_profile(profile.data)

    request.session['uid'] = profile.uid
    request.session['username'] = profile.name

    return redirect(furl(state).url)


@csrf_exempt
@transaction.atomic
def normal_login(request):
    """
    普通登录视图
    :param request: 请求对象
    :return: 返回json数据: user_info: 用户信息;has_login: 用户是否已登录
    """
    email = request.POST.get('email', '')  # 获取email
    password = request.POST.get('password', '')  # 获取password
    sign = request.POST.get('sign', '')  # 获取登录验证码的sign
    vcode = request.POST.get('vcode', '')  # 获取用户输入的验证码
    result = get_vcode(sign)  # 从redis中校验sign和vcode
    if not (result and (result.decode('utf-8') == vcode.lower())):
        return json_response(*UserError.VeriCodeError)  # 校验失败返回错误码300003
    try:
        user = User.objects.get(email=email)  # 使用email获取Django用户
    except User.DoesNotExist:
        return json_response(*UserError.UserNotFound)  # 获取失败返回错误码300001
    user = authenticate(request, username=user.username, password=password)  # 授权校验
    if user is not None:  # 校验成功，获得返回用户信息
        login(request, user)  # 登录用户，设置登录session
        profile, created = Profile.objects.select_for_update().get_or_create(  # 获取或创建Profile数据
            email=user.email,
        )
        if profile.user_src != Profile.COMPANY_USER:
            profile.name = user.username
            profile.user_src = Profile.NORMAL_USER
            profile.save()
        request.session['uid'] = profile.uid  # 设置Profile uid的session
        request.session['username'] = profile.name  # 设置用户名的session
        set_profile(profile.data)  # 将用户信息保存到redis，查用户信息从redis中查询
    else:
        return json_response(*UserError.PasswordError)  # 校验失败，返回错误码300002
    return json_response(200, 'OK', {  # 返回JSON格式数据
        'user_info': profile.data,
        'has_login': bool(profile),
    })

def login_vcode(request):
    """
    登录验证码获取
    :param request: 请求对象
    :return: vcode: 验证码图片的base64编码; sign: 校验码
    """

    b = BytesIO()
    img, check = get_pic_code()
    img.save(b, format='png')

    vcode = base64.b64encode(b.getvalue())

    sign = str(uuid.uuid1())
    set_vcode(sign, ''.join([str(i) for i in check]).lower())

    return json_response(200, 'OK', {
        'vcode': vcode.decode('utf-8'),
        'sign': sign
    })


@csrf_exempt
@transaction.atomic
def signup(request):
    email = request.POST.get('email', '')  # 邮箱
    password = request.POST.get('password', '')  # 密码
    password_again = request.POST.get('password_again', '')  # 确认密码
    vcode = request.POST.get('vcode', '')  # 注册验证码
    sign = request.POST.get('sign')  # 注册验证码检验位
    if password != password_again:  # 两次密码不一样，返回错误码300002
        return json_response(*UserError.PasswordError)
    result = get_vcode(sign)  # 校验vcode，逻辑和登录视图相同
    if not (result and (result.decode('utf-8') == vcode.lower())):
        return json_response(*UserError.VeriCodeError)
    if User.objects.filter(email__exact=email).exists():  # 检查数据库是否存在该用户
        return json_response(*UserError.UserHasExists)  # 返回错误码300004
    username = email.split('@')[0]  # 生成一个默认的用户名
    if User.objects.filter(username__exact=username).exists():
        username = email  # 默认用户名已存在，使用邮箱作为用户名
    User.objects.create_user(  # 创建用户，并设置为不可登录
        is_active=False,
        is_staff=False,
        username=username,
        email=email,
        password=password,
    )
    Profile.objects.create(  # 创建用户信息
        name=username,
        email=email
    )
    sign = str(uuid.uuid1())  # 生成邮箱校验码
    set_signcode(sign, email)  # 在redis设置30min时限的验证周期
    return json_response(200, 'OK', {  # 返回JSON数据
        'email': email,
        'sign': sign
    })


def sendmail(request):
    to_email = request.GET.get('email', '')  # 在url中获取的注册邮箱地址
    sign = request.GET.get('sign', '')  # 在url中获取的sign标识
    if not get_has_sentregemail(to_email):  # 检查用户是否在同一时间多次点击发送邮件
        title = '[Quizz.cn用户激活邮件]'  # 定义邮件标题
        sender = settings.EMAIL_HOST_USER  # 获取发送邮件的邮箱地址
        url = settings.DOMAIN + '/auth/email_notify?email=' + to_email + '&sign=' + sign  # 回调函数
        msg = '您好，Quizz.cn管理员想邀请您激活您的用户，点击链接激活。{}'.format(url)  # 邮件内容
        ret = send_mail(title, msg, sender, [to_email], fail_silently=True)  # 发送邮件并获取发送结果
        if not ret:
            return json_response(*UserError.UserSendEmailFailed)  # 发送出错，返回错误码300006
        set_has_sentregemail(to_email)  # 正常发送，设置3分钟的继续发送限制
        return json_response(200, 'OK', {})  # 返回空JSON数据
    else:
        return json_response(*UserError.UserHasSentEmail)  # 如果用户同一时间多次点击发送，返回错误码300005



@csrf_exempt
@transaction.atomic
def reset_password(request):
    email = request.POST.get('email', '')
    new_password = request.POST.get('new_password', '')
    new_password_again = request.POST.get('new_password_again', '')
    is_biz = request.POST.get('is_biz', 0)

    if new_password != new_password_again:
        return json_response(*UserError.PasswordError)

    try:
        User.objects.get(email=email)
    except User.DoesNotExist:
        return json_response(*UserError.UserNotFound)

    if not get_has_sentemail(email):
        sign = str(uuid.uuid1())
        set_passwd(sign, new_password)
        set_has_sentemail(email)

        title = '[Quizz.cn密码重置邮件]'
        sender = settings.EMAIL_HOST_USER
        url = settings.DOMAIN + '/auth/reset_notify?email=' + email + '&sign=' + sign + '&is_biz=' + str(is_biz)
        msg = '您好，Quizz.cn管理员想邀请您确认是否重置密码？{}'.format(url)

        ret = send_mail(title, msg, sender, [email], fail_silently=True)
        if not ret:
            return json_response(*UserError.UserSendEmailFailed)

        return json_response(200, 'OK', {})

    else:
        return json_response(*UserError.UserHasSentEmail)
