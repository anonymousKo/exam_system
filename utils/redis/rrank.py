# -*- coding: utf-8 -*-

import json

from utils.jsonencoder import JsonEncoder
from utils.redis.connect import r
from utils.redis.constants import REDIS_RANK, REDIS_RANK_USER_INFO
from utils.redis.rprofile import get_profile


def add_to_rank(uid, kind_id, score, time):
    key = REDIS_RANK % kind_id
    pre_score = int(r.zscore(key, uid)) if r.zscore(key, uid) else 0
    rank_socre = score * 100000000 + (86400000 - time)

    if pre_score == 0 or (pre_score != 0 and rank_socre > pre_score):
        r.zadd(key, rank_socre, uid)
        user_info = get_profile(uid)
        ret = {
            'nickname': user_info.get('nickname', ''),
            'numid': user_info.get('numid', ''),
            'avatar': user_info.get('avatar', ''),
            'score': score,
            'time': time
        }
        r.hset(REDIS_RANK_USER_INFO % kind_id, uid, json.dumps(ret, cls=JsonEncoder))


def get_rank(kind_id, uid):
    key = REDIS_RANK % kind_id
    rank = r.zrevrank(key, uid)
    return (int(rank) + 1) if rank is not None else None

def get_user_rank(kind_id, uid):
    key = REDIS_RANK_USER_INFO % kind_id
    ret = r.hget(key, uid)
    return json.loads(ret.decode('utf-8')) if ret else {}


def get_rank_data(kind_id, start=0, end=-1):
    ranks = r.zrevrange(REDIS_RANK % kind_id, start, end)
    if not ranks:
        return [], []
    ret = r.hmget(REDIS_RANK_USER_INFO % kind_id, ranks)
    ret = [json.loads(i.decode('utf-8') if i else '{}') for i in ret]
    return ranks, ret
