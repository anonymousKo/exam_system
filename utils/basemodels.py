# -*- coding: utf-8 -*-

import os

from django.db import models # 基础模型
from django.utils.translation import ugettext_lazy as _  # 引入延迟加载方法，只有在视图渲染时该字段才会呈现出翻译值
from TimeConvert import TimeConvert as tc

class CreateUpdateMixin(models.Model):
    """模型创建和更新时间戳Mixin"""
    status = models.BooleanField(_(u'状态'), default=True, help_text=u'状态', db_index=True) # 状态值, True和False
    created_at = models.DateTimeField(_(u'创建时间'), auto_now_add=True, editable=True, help_text=_(u'创建时间')) # 创建时间
    updated_at = models.DateTimeField(_(u'更新时间'), auto_now=True, editable=True, help_text=_(u'更新时间'))  # 更新时间

    class Meta:
        abstract = True  # 抽象类，只用作继承用，不会生成表


class MediaMixin(models.Model):
    # 图片
    image_url = models.CharField(_(u'图片链接'), max_length=255, blank=True, null=True, help_text=u'题目图片')
    # 音频
    audio_url = models.CharField(_(u'音频链接'), max_length=255, blank=True, null=True, help_text=u'题目音频')
    audio_time = models.IntegerField(_(u'音频时长'), default=0, help_text=u'题目音频时长')

    class Meta:
        abstract = True

    @property
    def media(self):
        return [
            {
                'type': 'image',
                'image_url': self.image_url,
            },
            {
                'type': 'audio',
                'audio_url': self.audio_url,
                'audio_time': self.audio_time,
            },
        ]


class ModelHelper(object):
    def upload_path(self, instance, filename):
        # file will be uploaded to MEDIA_ROOT/file/<ym>/<stamp>.<ext>
        return '{ym}/{stamp}{ext}'.format(
            ym=tc.local_string(format='%Y%m'),
            stamp=tc.local_timestamp(ms=True),
            ext=os.path.splitext(filename)[1].lower(),
        )


__mh = ModelHelper()
upload_path = __mh.upload_path
