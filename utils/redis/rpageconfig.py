# -*- coding: utf-8 -*-

import json

from utils.jsonencoder import JsonEncoder
from utils.redis.connect import r
from utils.redis.constants import PAGE_CONFIG_INFO, FORM_REGEX_CONFIG


def set_pageconfig(data):
    if isinstance(data, dict):
        app_id = data.get('app_id', '')
        key = PAGE_CONFIG_INFO % app_id
        data = json.dumps(data, cls=JsonEncoder)
        r.set(key, data)


def get_pageconfig(app_id):
    key = PAGE_CONFIG_INFO % app_id
    data = r.get(key).decode('utf-8') if r.get(key) else '{}'
    return json.loads(data)


def get_pageconfig_json(app_id):
    key = PAGE_CONFIG_INFO % app_id
    data = r.get(key).decode('utf-8') if r.get(key) else '{}'
    return data


def set_form_regex(field, value):
    key = FORM_REGEX_CONFIG
    value = json.dumps(value) if isinstance(value, dict) else ''
    r.hset(key, field, value)


def get_form_regex(field):
    key = FORM_REGEX_CONFIG
    value = r.hget(key, field).decode('utf-8') if r.hget(key, field) else '{}'
    return json.loads(value)


def rem_form_regex(field):
    key = FORM_REGEX_CONFIG
    r.hdel(key, field)
