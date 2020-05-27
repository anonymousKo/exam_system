# -*- coding: utf-8 -*-

import datetime
import logging
from functools import wraps

from django.shortcuts import render
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt

from competition.models import CompetitionKindInfo
from utils.errors import (CompetitionError, CompetitionHasEnded,
                          CompetitionNotFound, CompetitionNotStarted,
                          ProfileError, ProfileNotFound)
from utils.response import json_response


def check_login(func=None):
    @wraps(func)
    def wrapper(request, *args, **kwargs):
        uid = request.session.get('uid', '')

        if not uid:
            if request.path.startswith('/bs'):
                return render(request, 'err.html', ProfileNotFound)
            elif request.path.startswith('/api'):
                return json_response(*ProfileError.ProfileNotFound)

        return func(request, *args, **kwargs)

    return wrapper


def check_copstatus(func=None):
    @wraps(func)
    def wrapper(request, *args, **kwargs):
        kind_id = request.GET.get('kind_id', '') or request.POST.get('kind_id', '')

        try:
            kind_info = CompetitionKindInfo.objects.get(kind_id=kind_id)
        except CompetitionKindInfo.DoesNotExist:
            if request.path.startswith('/bs'):
                return render(request, 'err.html', CompetitionNotFound)
            if request.path.startswith('/api'):
                return json_response(*CompetitionError.CompetitionNotFound)

        if kind_info.cop_finishat < datetime.datetime.now(tz=datetime.timezone.utc):
            if request.path.startswith('/bs'):
                return render(request, 'err.html', CompetitionHasEnded)
            if request.path.startswith('/api'):
                return json_response(*CompetitionError.CompetitionHasEnded)

        if kind_info.cop_startat > datetime.datetime.now(tz=datetime.timezone.utc):
            if request.path.startswith('/bs'):
                return render(request, 'err.html', CompetitionNotStarted)
            if request.path.startswith('/api'):
                return json_response(*CompetitionError.CompetitionNotStarted)

        return func(request, *args, **kwargs)

    return wrapper



def logerr(func=None):
    @wraps(func)
    def wrapper(request, *args, **kwargs):
        name = func.__name__
        if not settings.DEBUG:
            logger = logging.getLogger('file')

            try:
                logger.debug('func=%s&flag=%s&content=%s', name, 'BODY', request.body)
            except Exception as e:
                logger.error('func=%s&flag=%s&content=%s', name, 'ERROR', e)

            if request.method == 'GET':
                logger.debug('func=%s&flag=%s&content=%s', name, 'GET', request.GET)

            if request.method == 'POST':
                logger.debug('func=%s&flag=%s&content=%s', name, 'POST', request.POST)
            response = func(request, *args, **kwargs)
            try:
                logger.debug('func=%s&flag=%s&content=%s', name, 'RESPONSE', response.content)
            except Exception as e:
                logger.error('func=%s&flag=%s&content=%s', name, 'ERROR', e)

            return response
        return func(request, *args, **kwargs)

    return wrapper
