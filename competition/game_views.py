# -*- coding: utf-8 -*-

import datetime
import random

from django.db import transaction
from django.views.decorators.csrf import csrf_exempt

from account.models import Profile, UserInfo
from competition.models import (BankInfo, ChoiceInfo, CompetitionKindInfo,
                                CompetitionQAInfo, FillInBlankInfo)
from TimeConvert import TimeConvert as tc

from utils.check_utils import check_correct_num
from utils.decorators import check_copstatus, check_login
from utils.errors import BankInfoNotFound, CompetitionError, ProfileError
from utils.redis.rprofile import enter_userinfo
from utils.redis.rrank import add_to_rank
from utils.response import json_response


@check_login
@check_copstatus
@transaction.atomic
def get_questions(request):
    """
    获取题目信息接口
    :param request: 请求对象
    :return: 返回json数据: user_info: 用户信息;kind_info: 比赛信息;qa_id: 比赛答题记录;questions: 比赛随机后的题目;
    """
    kind_id = request.GET.get('kind_id', '')  # 获取kind_id
    uid = request.GET.get('uid', '')  # 获取uid
    try:  # 获取比赛信息
        kind_info = CompetitionKindInfo.objects.select_for_update().get(kind_id=kind_id)
    except CompetitionKindInfo.DoesNotExist:  # 未获取到，返回错误码100001
        return json_response(*CompetitionError.CompetitionNotFound)
    try:  # 获取题库信息
        bank_info = BankInfo.objects.get(bank_id=kind_info.bank_id)
    except BankInfo.DoesNotExist:  # 未获取到，返回错误码100004
        return json_response(*CompetitionError.BankInfoNotFound)
    try:  # 获取用户信息
        profile = Profile.objects.get(uid=uid)
    except Profile.DoesNotExist:  # 未获取到，返回错误码200001
        return json_response(*ProfileError.ProfileNotFound)
    qc = ChoiceInfo.objects.filter(bank_id=kind_info.bank_id) # 选择题
    qf = FillInBlankInfo.objects.filter(bank_id=kind_info.bank_id)  # 填空题
    questions = []  # 将两种题型放到同一个列表中
    for i in qc.iterator():
        questions.append(i.data)
    for i in qf.iterator():
        questions.append(i.data)
    question_num = kind_info.question_num  # 出题数
    q_count = bank_info.total_question_num  # 总题数
    if q_count < question_num:  # 出题数大于总题数，返回错误码100005
        return json_response(CompetitionError.QuestionNotSufficient)
    qs = random.sample(questions, question_num)  # 随机分配题目
    qa_info = CompetitionQAInfo.objects.select_for_update().create(  # 创建答题log数据
        kind_id=kind_id,
        uid=uid,
        qsrecord=[q['question'] for q in qs],
        asrecord=[q['answer'] for q in qs],
        total_num=question_num,
        started_stamp=tc.utc_timestamp(ms=True, milli=True),  # 设置开始时间戳
        started=True
    )
    for i in qs:  # 剔除答案信息
        i.pop('answer')
    return json_response(200, 'OK', {  # 返回JSON数据，包括题目信息，答题log信息等
        'kind_info': kind_info.data,
        'user_info': profile.data,
        'qa_id': qa_info.qa_id,
        'questions': qs
    })

@csrf_exempt
@check_login
@check_copstatus
@transaction.atomic
def submit_answer(request):
    """
    提交答案接口
    :param request: 请求对象
    :return: 返回json数据: user_info: 用户信息; qa_id: 比赛答题记录标识; kind_id: 比赛唯一标识
    """
    stop_stamp = tc.utc_timestamp(ms=True, milli=True)  # 结束时间戳
    qa_id = request.POST.get('qa_id', '')  # 获取qa_id
    uid = request.POST.get('uid', '')  # 获取uid
    kind_id = request.POST.get('kind_id', '')  # 获取kind_id
    answer = request.POST.get('answer', '')  # 获取answer
    try:  # 获取比赛信息
        kind_info = CompetitionKindInfo.objects.get(kind_id=kind_id)
    except CompetitionKindInfo.DoesNotExist:  # 未获取到，返回错误码100001
        return json_response(*CompetitionError.CompetitionNotFound)
    try:  # 获取题库信息
        bank_info = BankInfo.objects.get(bank_id=kind_info.bank_id)
    except BankInfo.DoesNotExist:  # 未获取到返回错误码100004
        return json_response(*CompetitionError.BankInfoNotFound)
    try:  # 获取用户信息
        profile = Profile.objects.get(uid=uid)
    except Profile.DoesNotExist:  # 未获取到，返回错误码200001
        return json_response(*ProfileError.ProfileNotFound)
    try:  # 获取答题log信息
        qa_info = CompetitionQAInfo.objects.select_for_update().get(qa_id=qa_id)
    except CompetitionQAInfo.DoesNotExist:  # 未获取到，返回错误码100006
        return json_response(*CompetitionError.QuestionNotFound)

    answer = answer.rstrip('#').split('#')  # 处理答案数据
    total, correct, wrong = check_correct_num(answer)  # 检查答题情况
    qa_info.aslogrecord = answer
    qa_info.finished_stamp = stop_stamp
    qa_info.expend_time = stop_stamp - qa_info.started_stamp
    qa_info.finished = True
    qa_info.correct_num = correct if total == qa_info.total_num else 0
    qa_info.incorrect_num = wrong if total == qa_info.total_num else qa_info.total_num
    qa_info.save()  # 保存答题log
    if qa_info.correct_num == kind_info.question_num:  # 得分处理
        score = kind_info.total_score
    elif not qa_info.correct_num:
        score = 0
    else:
        score = round((kind_info.total_score / kind_info.question_num) * correct, 3)
    qa_info.score = score  # 继续保存答题log
    qa_info.save()
    kind_info.total_partin_num += 1  # 保存比赛数据
    kind_info.save()  # 比赛答题次数
    bank_info.partin_num += 1
    bank_info.save()  # 题库答题次数
    if (kind_info.period_time > 0) and (qa_info.expend_time > kind_info.period_time * 60 * 1000):  # 超时，不加入排行榜
        qa_info.status = CompetitionQAInfo.OVERTIME
        qa_info.save()
    else:  # 正常完成，加入排行榜
        add_to_rank(uid, kind_id, qa_info.score, qa_info.expend_time)
        qa_info.status = CompetitionQAInfo.COMPLETED
        qa_info.save()
    return json_response(200, 'OK', {  # 返回JSON数据
        'qa_id': qa_id,
        'user_info': profile.data,
        'kind_id': kind_id,
    })


@csrf_exempt
@check_login
@check_copstatus
@transaction.atomic
def userinfo_entry(request):
    """
    用户表单提交接口
    :param request: 请求对象
    :return: 返回json数据: user_info: 用户信息; kind_info: 比赛信息
    """

    uid = request.POST.get('uid', '')
    kind_id = request.POST.get('kind_id', '')
    result = request.POST.get('result', '')

    try:
        profile = Profile.objects.get(uid=uid)
    except Profile.DoesNotExist:
        return json_response(*ProfileError.ProfileNotFound)

    try:
        kind_info = CompetitionKindInfo.objects.get(kind_id=kind_id)
    except CompetitionKindInfo.DoesNotExist:
        return json_response(*CompetitionError.CompetitionNotFound)

    rl = [i.split(',') for i in result.rstrip('#').split('#')]

    ui, _ = UserInfo.objects.select_for_update().get_or_create(
        uid=uid,
        kind_id=kind_id
    )

    for i in rl:
        if hasattr(UserInfo, i[0]):
            setattr(ui, i[0], i[1])
    ui.save()

    enter_userinfo(kind_id, uid)

    return json_response(200, 'OK', {
        'user_info': profile.data,
        'kind_info': kind_info.data
    })




@csrf_exempt
def games(request, s):
    """
    获取所有比赛接口
    :param request: 请求对象
    :param s: 请求关键字
    :return: 返回该请求关键字对应的所有比赛类别
    """

    if s == 'hot':
        # 筛选条件: 完成时间大于当前时间;根据参与人数降序排序;根据创建时间降序排序;筛选10个
        kinds = CompetitionKindInfo.objects.filter(
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc),
        ).order_by('-total_partin_num').order_by('-created_at')[:10]

    elif s == 'tech':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.IT_ISSUE,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    elif s == 'edu':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.EDUCATION,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    elif s == 'culture':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.CULTURE,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    elif s == 'sport':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.SPORT,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    elif s == 'general':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.GENERAL,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    elif s == 'interview':
        kinds = CompetitionKindInfo.objects.filter(
            kind_type=CompetitionKindInfo.INTERVIEW,
            cop_finishat__gt=datetime.datetime.now(tz=datetime.timezone.utc)
        ).order_by('-total_partin_num').order_by('-created_at')

    else:
        kinds = None

    uid = request.session.get('uid', '')
    return json_response(200, 'OK', {
        'kinds': [i.data for i in kinds],
        'uid'  : uid
    })