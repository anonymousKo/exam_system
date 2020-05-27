# -*- coding: utf-8 -*-

from django.db import transaction
from django.views.decorators.csrf import csrf_exempt

from competition.models import BankInfo, CompetitionKindInfo
from business.models import BusinessAccountInfo, AppConfigInfo, BusinessAppInfo
from account.models import Profile

from utils.response import json_response
from utils.redis.rpageconfig import set_pageconfig
from utils.errors import SetError, BizError, ProfileError
from utils.decorators import check_login, logerr


def banks(request, s):
    if s == '999':
        banks = BankInfo.objects.values_list('bank_name', 'bank_id', 'kind_num', 'choice_num', 'fillinblank_num').order_by('-kind_num')
        return json_response(200, 'OK', {'banks': [{'bank_name': b[0], 'bank_id': b[1], 'kind_num': b[2], 'total_question_num': b[3] + b[4]} for b in banks]})
    bank_types = [t[0] for t in BankInfo.BANK_TYPES]

    if int(s) in bank_types:
        banks = BankInfo.objects.filter(bank_type=s).values_list('bank_name', 'bank_id', 'kind_num', 'choice_num', 'fillinblank_num')
        return json_response(200, 'OK', {'banks': [{'bank_name': b[0], 'bank_id': b[1], 'kind_num': b[2], 'total_question_num': b[3] + b[4]} for b in banks]})

    return json_response(*SetError.BankTypeError)


def bank_detail(request, bank_id):
    try:
        bank = BankInfo.objects.get(bank_id=bank_id)
    except BankInfo.DoesNotExist:
        return json_response(*SetError.BankInfoNotFound)

    return json_response(200, 'OK', {'bank_info': bank.data})


@logerr
@csrf_exempt
@check_login
@transaction.atomic
def set_bank(request):
    account_id = request.POST.get('account_id', '')
    uid = request.POST.get('uid', '')
    bank_id = request.POST.get('bank_id', '')
    kind_name = request.POST.get('kind_name', '')
    sponsor_name = request.POST.get('sponsor_name', '')
    question_num = int(request.POST.get('question_num', 1))
    total_score = int(request.POST.get('total_score', 100))
    cop_startat = request.POST.get('cop_startat')
    cop_finishat = request.POST.get('cop_finishat')
    period = request.POST.get('period')
    rule_text = request.POST.get('rule_text', '')
    is_show_userinfo = request.POST.get('is_show_userinfo', 'false')
    form_data = request.POST.get('form_data', '')
    field_name_data = request.POST.get('field_name_data', '')
    option_data = request.POST.get('option_data', '')

    try:
        BusinessAccountInfo.objects.select_for_update().get(account_id=account_id)
    except BusinessAccountInfo.DoesNotExist:
        return json_response(*BizError.BizAccountNotFound)

    try:
        profile = Profile.objects.select_for_update().get(uid=uid)
    except Profile.DoesNotExist:
        return json_response(*ProfileError.ProfileNotFound)

    try:
        bank_info = BankInfo.objects.select_for_update().get(bank_id=bank_id)
    except BankInfo.DoesNotExist:
        return json_response(*SetError.BankInfoNotFound)

    app_info = BusinessAppInfo.objects.select_for_update().create(
        account_id=account_id,
        app_name=kind_name
    )

    app_config_values = {
        'app_name': kind_name,
        'rule_text': rule_text,
        'is_show_userinfo': True if is_show_userinfo == 'true' else False,
        'userinfo_fields': form_data.rstrip('#'),
        'userinfo_field_names': field_name_data.rstrip('#'),
        'option_fields': option_data.rstrip('#'),
    }

    app_config_info, app_config_created = AppConfigInfo.objects.select_for_update().get_or_create(
        app_id=app_info.app_id,
        defaults=app_config_values
    )

    if not app_config_created:
        for k, v in app_config_values.items():
            setattr(app_config_info, k, v)
        app_config_info.save()

    kind_values = {
        'kind_name': kind_name,
        'sponsor_name': sponsor_name,
        'kind_type': bank_info.bank_type,
        'total_score': total_score,
        'question_num': question_num,
        'cop_startat': cop_startat,
        'period_time': period or 0,
        'cop_finishat': cop_finishat
    }
    kind_info, kind_created = CompetitionKindInfo.objects.select_for_update().get_or_create(
        account_id=account_id,
        app_id=app_info.app_id,
        bank_id=bank_id,
        defaults=kind_values
    )

    if not kind_created:
        for k, v in kind_values.items():
            setattr(kind_info, k, v)
        kind_info.save()

    set_pageconfig(app_config_info.data)

    return json_response(200, 'OK', {
        'kind_info': kind_info.data,
    })