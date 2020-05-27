# -*- coding: utf-8 -*-

"""

Redis Connect function:

"""

import redis
from django.conf import settings


def redis_conf(conf):
    return {
        'host': conf.get('HOST', 'localhost'),
        'port': conf.get('PORT', 6379),
        'password': '{}:{}'.format(conf.get('USER', ''), conf.get('PASSWORD', '')) if conf.get('USER') else '',
        'db': conf.get('db', 0),
    }


def connector(conf):
    return redis.StrictRedis(connection_pool=redis.ConnectionPool(**redis_conf(conf)))


r = connector(settings.REDIS.get('default', {}))
