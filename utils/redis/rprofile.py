# -*- coding: utf-8 -*-

import json

from utils.jsonencoder import JsonEncoder
from utils.redis.connect import r
from utils.redis.constants import (REDIS_USER_INFO, USER_LOGIN_VCODE, USER_PASSWORD_RESET,
                                   USER_SIGN_VCODE, USERINFO_HAS_ENTERED, USER_HAS_SENT_EMAIL,
                                   USER_HAS_SENT_REGEMAIL)


def set_profile(data={}):
    if isinstance(data, dict):
        uid = data.get('uid', '')
        key = REDIS_USER_INFO % uid
        data = json.dumps(data, cls=JsonEncoder)
        r.set(key, data)


def delete_profile(uid):
    r.delete(REDIS_USER_INFO % uid)


def get_profile(uid):
    ret = r.get(REDIS_USER_INFO % uid).decode('utf-8') if r.get(REDIS_USER_INFO % uid) else '{}'
    return json.loads(ret)


def enter_userinfo(kind_id, uid):
    key = USERINFO_HAS_ENTERED % (kind_id, uid)
    r.set(key, 1)


def get_enter_userinfo(kind_id, uid):
    key = USERINFO_HAS_ENTERED % (kind_id, uid)
    return r.get(key)


def set_vcode(sign, value):
    key = USER_LOGIN_VCODE % sign
    r.setex(key, 180, value)


def get_vcode(sign):
    key = USER_LOGIN_VCODE % sign
    return r.get(key)


def set_signcode(sign, value):
    key = USER_SIGN_VCODE % sign
    r.setex(key, 1800, value)


def get_signcode(sign):
    key = USER_SIGN_VCODE % sign
    return r.get(key)


def set_passwd(sign, passwd):
    key = USER_PASSWORD_RESET % sign
    r.setex(key, 1860, passwd)


def get_passwd(sign):
    key = USER_PASSWORD_RESET % sign
    return r.get(key)


def set_has_sentemail(email):
    r.setex(USER_HAS_SENT_EMAIL % email, 1800, 1)


def get_has_sentemail(email):
    return r.get(USER_HAS_SENT_EMAIL % email)


def set_has_sentregemail(email):
    r.setex(USER_HAS_SENT_REGEMAIL % email, 60, 1)


def get_has_sentregemail(email):
    return r.get(USER_HAS_SENT_REGEMAIL % email)