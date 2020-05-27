# -*- coding: utf-8 -*-

from account.models import Profile
from competition.models import CompetitionKindInfo

from utils.response import json_response
from utils.decorators import check_login
from utils.redis.rrank import get_user_rank, get_rank
from utils.errors import UserError, CompetitionError


@check_login
def get_my_rank(request):
    uid = request.GET.get('uid', '')
    kind_id = request.GET.get('kind_id', '')

    try:
        profile = Profile.objects.get(uid=uid)
    except Profile.DoesNotExist:
        return json_response(*UserError.UserNotFound)

    try:
        kind_info = CompetitionKindInfo.objects.get(kind_id=kind_id)
    except CompetitionKindInfo.DoesNotExist:
        return json_response(*CompetitionError.CompetitionNotFound)

    return json_response(200, 'OK', {
        'time': get_user_rank(kind_id, uid).get('time', 0),
        'score': get_user_rank(kind_id, uid).get('score', 0),
        'rank': get_rank(kind_id, uid)
    })
