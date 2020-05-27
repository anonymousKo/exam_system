# -*- coding: utf-8 -*-

# extensions consts
KEY_PREFIX = 'r'

# rank consts
REDIS_RANK = 'x:competition:rank:%s'  # 排行榜名次(params: kind_id; value: uid)
REDIS_RANK_USER_INFO = 'x:competition:rank:user:info:%s'  # 排行榜用户信息(params: kind_id; value: uid; data: profile data)


# profile consts
REDIS_USER_INFO = 'x:competition:user:info:%s'  # 用户信息(params: uid, value: profile data)
USERINFO_HAS_ENTERED = 'x:competition:userinfo:has:entered:%s:%s'  # 用户是否已经填写表单(params: kind_id, uid)
USER_LOGIN_VCODE = 'x:competition:user:login:vcode:%s'  # 用户登录验证码(params: sign, data: value)
USER_SIGN_VCODE = 'x:competition:user:sign:vcode:%s'  # 用户注册邮箱验证码(params: sign, data: value)
USER_PASSWORD_RESET = 'x:competition:user:password:reset:%s'  # 用户重置密码记录(params: uid, data: password)
USER_HAS_SENT_EMAIL = 'x:competition:has:sent:email:%s'  # 用户是否已经发送邮件验证(params: email, data: true, false)
USER_HAS_SENT_REGEMAIL = 'x:competition:has:sent:reg:email:%s'  # 用户是否已经发送注册验证邮件(params: email, data: true, false)


# page config consts
PAGE_CONFIG_INFO = 'x:competition:page:config:info:%s'  # 页面配置信息(params: app_id, value: app_data)
FORM_REGEX_CONFIG = 'x:competition:form:regex:config'  # 表单正则表达式配置(params: field_name, value: config)
