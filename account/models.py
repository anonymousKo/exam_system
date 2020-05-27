# -*- coding: utf-8 -*-
from django.conf import settings
from django.db import models
from django.utils.translation import ugettext_lazy as _

from shortuuidfield import ShortUUIDField
from TimeConvert import TimeConvert as tc
from utils.basemodels import CreateUpdateMixin, upload_path

class Profile(CreateUpdateMixin):
    """
    用户信息类
    """

    WX_USER = 1
    GUEST_USER = 11
    NORMAL_USER = 22
    COMPANY_USER = 33

    USER_SRC = (
        (WX_USER, u'微信授权用户'),
        (GUEST_USER, u'游客用户'),
        (NORMAL_USER, u'普通用户'),
        (COMPANY_USER, u'机构用户'),
    )

    MALE = 1
    FEMALE = 0

    GENDER = (
        (MALE, u'男'),
        (FEMALE, u'女'),
    )

    UNVERIFIED = 0
    ACTIVATED = 1
    DISABLED = 2
    DELETED = 3
    ASSIGN = 10

    USER_STATUS = (
        (UNVERIFIED, u'未验证'),
        (ACTIVATED, u'已激活'),
        (DISABLED, u'已禁用'),
        (DELETED, u'已删除'),
        (ASSIGN, u'已分配'),
    )

    uid = ShortUUIDField(_(u'用户id'), max_length=32, blank=True, null=True, help_text=u'用户唯一标识', db_index=True, unique=True)
    # 用户相关
    user_src = models.IntegerField(_(u'用户来源'), choices=USER_SRC, default=GUEST_USER, help_text=u'用户来源', db_index=True)
    user_status = models.IntegerField(_(u'用户状态'), choices=USER_STATUS, default=ACTIVATED)
    # 微信授权用户
    unionid = models.CharField(_(u'微信unionid'), max_length=32, blank=True, null=True, help_text=u'微信 Unionid', db_index=True)
    # 微信openid
    openid = models.CharField(_(u'微信openid'), max_length=32, blank=True, null=True, db_index=True, help_text=u'微信授权Openid')
    # 用户基本信息
    wxid = models.CharField(_(u'微信号'), max_length=32, blank=True, null=True, help_text=u'用户微信号')
    name = models.CharField(_(u'姓名'), max_length=32, blank=True, null=True, help_text=u'用户姓名', db_index=True)
    email = models.CharField(_(u'邮箱'), max_length=40, blank=True, null=True, help_text=u'用户邮箱', db_index=True)
    sex = models.IntegerField(_(u'性别'), choices=GENDER, default=MALE, help_text=u'用户性别')
    age = models.IntegerField(_(u'年龄'), default=0, help_text=u'用户年龄')
    nickname = models.CharField(_(u'昵称'), max_length=32, blank=True, null=True, help_text=u'用户昵称')
    avatar = models.CharField(_(u'头像地址'), max_length=60, blank=True, null=True, help_text=u'用户头像')
    phone = models.CharField(_(u'手机号'), max_length=11, blank=True, null=True, help_text=u'用户电话', db_index=True)
    country = models.CharField(_(u'国家'), max_length=32, blank=True, null=True, help_text=u'用户国家')
    province = models.CharField(_(u'省份'), max_length=32, blank=True, null=True, help_text=u'用户省份')
    city = models.CharField(_(u'城市'), max_length=32, blank=True, null=True, help_text=u'用户城市')
    location = models.CharField(_(u'地址'), max_length=60, blank=True, null=True, help_text=u'用户地址')

    # 会员相关
    is_upgrade = models.IntegerField(_(u'是否升级会员'), default=0, help_text=u'是否升级会员')
    upgrade_time = models.DateTimeField(_(u'会员升级时间'), blank=True, null=True, help_text=u'升级日期')
    expire_time = models.DateTimeField(_(u'会员过期时间'), blank=True, null=True, help_text=u'过期时间')
    upgrade_count = models.IntegerField(_(u'会员升级次数'), default=0, help_text=u'升级次数')

    class Meta:
        verbose_name = _(u'用户信息')
        verbose_name_plural = _(u'用户信息')
        unique_together = ('name', 'email')

    def __unicode__(self):
        return str(self.pk)

    @property
    def numid(self):
        return settings.BASE_NUM_ID + self.pk

    @property
    def data(self):
        return {
            'uid': self.uid,
            'numid': self.numid,
            'name': self.name or '',
            'nickname': self.nickname or self.name,
            'avatar': self.avatar or '',
        }

    @property
    def final_is_upgrade(self):
        return int(self.is_upgrade and tc.utc_datetime() < self.expire_time)

    @property
    def upgrade_data(self):
        return {
            'uid': self.uid,
            'is_upgrade': self.final_is_upgrade,
            'upgrade_time': tc.datetime_to_string(tc.to_local_datetime(self.upgrade_time)) if self.final_is_upgrade and self.upgrade_time else '',
            'expire_time': tc.datetime_to_string(tc.to_local_datetime(self.expire_time)) if self.final_is_upgrade and self.expire_time else '',
            'upgrade_count': self.upgrade_count,
        }


class UserInfo(CreateUpdateMixin):
    """
    用户所填表单信息类
    """

    # 标识
    kind_id = models.CharField(_(u'比赛id'), max_length=32, blank=True, null=True, help_text=u'比赛唯一标识', db_index=True)
    uid = models.CharField(_(u'用户id'), max_length=32, blank=True, null=True, help_text=u'用户唯一标识', db_index=True)
    # 基本信息
    name = models.CharField(_(u'姓名'), max_length=24, blank=True, null=True, help_text=u'name/姓名')
    sex = models.CharField(_(u'性别'), max_length=1, blank=True, null=True, help_text=u'sex/性别')
    age = models.IntegerField(_(u'年龄'), default=0, blank=True, null=True, help_text=u'age/年龄')
    phone = models.CharField(_(u'手机号'), max_length=11, blank=True, null=True, help_text=u'phone/手机号')
    wxid = models.CharField(_(u'微信号'), max_length=24, blank=True, null=True, help_text=u'wxid/微信号')
    email = models.CharField(_(u'邮箱'), max_length=60, blank=True, null=True, help_text=u'email/邮箱')
    pid = models.CharField(_(u'身份证号'), max_length=18, blank=True, null=True, help_text=u'pid/身份证号')
    graduated_from = models.CharField(_(u'毕业院校'), max_length=60, blank=True, null=True, help_text=u'graduated_from/毕业院校')
    address = models.CharField(_(u'地址'), max_length=60, blank=True, null=True, help_text=u'address/联系地址')

    class Meta:
        verbose_name = _(u'用户登记信息')
        verbose_name_plural = _(u'用户登记信息')
        unique_together = ('kind_id', 'uid')

    def __unicode__(self):
        return self.uid
