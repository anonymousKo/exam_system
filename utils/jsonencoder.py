# -*- coding: utf-8 -*-

from __future__ import unicode_literals

import datetime
import decimal
import json
import uuid

from django.core.serializers import serialize
from django.db import models
from django.utils.timezone import is_aware


class JsonEncoder(json.JSONEncoder):
    def default(self, o):
        # for datetime
        if isinstance(o, datetime.datetime):
            t = o.isoformat()
            t = t[:23] + t[26:] if o.microsecond else t[:]
            t = t[:-6] + 'Z' if t.endswith('+00:00') else t[:]
            return t

        # for date
        if isinstance(o, datetime.date):
            return o.isoformat()

        # for time
        if isinstance(o, datetime.time):
            if is_aware(o):
                raise ValueError("Timezone aware times can't be serialized.")
            t = o.isoformat()
            t = t[:12] if o.microsecond else t[:]
            return t

        # for decimal
        if isinstance(o, decimal.Decimal):
            return str(o)

        # for uuid
        if isinstance(o, uuid.UUID):
            return str(o)

        # for single model serialize
        if isinstance(o, models.Model):
            data = serialize('json', [o])
            data = data.lstrip('[').rstrip(']')
            return data

        # for multi model serialize
        if isinstance(o, models.QuerySet):
            return serialize('json', o)
