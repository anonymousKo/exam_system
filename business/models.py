# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models
from django.utils.translation import ugettext_lazy as _

from shortuuidfield import ShortUUIDField
from utils.basemodels import CreateUpdateMixin


class BusinessAccountInfo(CreateUpdateMixin):
    """ 出题帐户类 """

    INTERNET = 0
    FINANCE = 1
    ENERGY = 2
    INFRASTRUCTURE = 3
    TRANSPORTATION = 4
    COMMUNICATION = 5

    TYPE_CHOICES = (
        (INTERNET, '互联网'),
        (FINANCE, '金融'),
        (ENERGY, '能源'),
        (INFRASTRUCTURE, '基础建设'),
        (TRANSPORTATION, '交通'),
        (COMMUNICATION, '通信')
    )

    account_id = ShortUUIDField(_(u'出题账户id'), max_length=32, help_text=u'出题账户唯一标识', db_index=True)

    # 帐户信息
    email = models.CharField(_(u'邮箱'), max_length=40, blank=True, null=True, help_text=u'邮箱', db_index=True, unique=True)

    # 公司信息
    company_name = models.CharField(_(u'公司名称'), max_length=60, blank=True, null=True, help_text=u'公司名称')
    company_type = models.IntegerField(_(u'公司类型'), choices=TYPE_CHOICES, default=INTERNET, help_text=u'公司类型')
    company_description = models.TextField(_(u'公司描述'), blank=True, null=True, help_text=u'公司描述')
    company_username = models.CharField(_(u'联系人'), max_length=32, blank=True, null=True, help_text=u'公司联系人')
    company_phone = models.CharField(_(u'联系电话'), max_length=16, blank=True, null=True, help_text=u'公司联系电话', db_index=True)
    company_location = models.TextField(_(u'公司位置'), blank=True, null=True, help_text=u'公司联系地址')

    class Meta:
        verbose_name = _(u'出题账户')
        verbose_name_plural = _(u'出题账户')

    def __unicode__(self):
        return str(self.pk)

    @property
    def data(self):
        return {
            'email': self.email,
            'company_name': self.company_name,
            'company_type': self.company_type,
            'company_location': self.company_location,
            'company_username': self.company_username,
            'company_phone': self.company_phone,
        }


class BusinessAppInfo(CreateUpdateMixin):
    """ 应用信息类 """

    account_id = models.CharField(_(u'出题账户id'), max_length=32, help_text=u'出题账户唯一标识', db_index=True)

    # APP 配置信息
    app_id = ShortUUIDField(_(u'应用id'), max_length=32, help_text=u'应用唯一标识', db_index=True)
    app_name = models.CharField(_(u'应用名'), max_length=40, blank=True, null=True, help_text=u'应用名')
    app_description = models.TextField(_(u'应用描述'), blank=True, null=True, help_text=u'应用描述')

    class Meta:
        verbose_name = _(u'应用信息')
        verbose_name_plural = _(u'应用信息')

    def __unicode__(self):
        return str(self.pk)

    @property
    def data(self):
        return {
            'app_id': self.app_id,
            'app_name': self.app_name,
            'account_id': self.account_id,
        }


class AppConfigInfo(CreateUpdateMixin):
    """ 应用配置信息类 """

    app_id = models.CharField(_(u'应用id'), max_length=32, help_text=u'应用唯一标识', db_index=True)
    app_name = models.CharField(_(u'应用名'), max_length=40, blank=True, null=True, help_text=u'应用名')

    # 文案配置
    rule_text = models.TextField(_(u'比赛规则'), max_length=255, blank=True, null=True, help_text=u'比赛规则')

    # 显示信息
    is_show_userinfo = models.BooleanField(_(u'展示用户表单'), default=False, help_text=u'是否展示用户信息表单')
    userinfo_fields = models.CharField(_(u'用户表单字段'), max_length=128, blank=True, null=True, help_text=u'需要用户填写的字段#隔开')
    userinfo_field_names = models.CharField(_('用户表单label'), max_length=128, blank=True, null=True, help_text=u'用户需要填写的表单字段label名称')
    option_fields = models.CharField(_(u'下拉框字段'), max_length=128, blank=True, null=True, help_text=u'下拉框字段选项配置，#号隔开，每个字段由:h和，号组成。 如 option1:吃饭，喝水，睡觉#option2:上班，学习，看电影')

    class Meta:
        verbose_name = _(u'应用配置信息')
        verbose_name_plural = _(u'应用配置信息')

    def __unicode__(self):
        return str(self.pk)

    # 页面配置数据
    @property
    def show_info(self):
        return {
            'is_show_userinfo': self.is_show_userinfo,
            'userinfo_fields': self.userinfo_fields,
            'userinfo_field_names': self.userinfo_field_names,
            'option_fields': self.option_fields,
        }

    @property
    def text_info(self):
        return {
            'rule_text': self.rule_text,
        }

    @property
    def data(self):
        return {
            'show_info': self.show_info,
            'text_info': self.text_info,
            'app_id': self.app_id,
            'app_name': self.app_name
        }


class UserInfoImage(CreateUpdateMixin):
    """
    用户表单图片配置类
    """

    uii_name = models.CharField(_(u'配置名称'), max_length=32, blank=True, null=True, help_text=u'信息图片配置名称')
    # 用户信息
    name = models.CharField(_(u'姓名'), max_length=60, blank=True, null=True, help_text=u'姓名')
    sex = models.CharField(_(u'性别'), max_length=60, blank=True, null=True, help_text=u'性别')
    age = models.CharField(_(u'年龄'), max_length=60, blank=True, null=True, help_text=u'年龄')
    phone = models.CharField(_(u'手机号'), max_length=60, blank=True, null=True, help_text=u'电话')
    wxid = models.CharField(_(u'微信号'), max_length=60, blank=True, null=True, help_text=u'微信号')
    email = models.CharField(_(u'邮箱'), max_length=60, blank=True, null=True, help_text=u'邮箱')
    pid = models.CharField(_(u'身份证号'), max_length=60, blank=True, null=True, help_text=u'身份证号')
    graduated_from = models.CharField(_(u'毕业院校'), max_length=60, blank=True, null=True, help_text=u'毕业院校')
    address = models.CharField(_(u'地址'), max_length=60, blank=True, null=True, help_text=u'联系地址')
    resume = models.CharField(_(u'简历'), max_length=60, blank=True, null=True, help_text=u'简历')

    class Meta:
        verbose_name = _(u'用户信息图片配置')
        verbose_name_plural = _(u'用户信息图片配置')

    def __unicode__(self):
        return str(self.pk)

    @property
    def data(self):
        return {
            'name': self.name,
            'sex': self.sex,
            'age': self.age,
            'phone': self.phone,
            'wxid': self.wxid,
            'email': self.email,
            'pid': self.pid,
            'graduated_from': self.graduated_from,
            'address': self.address,
        }


class UserInfoRegex(CreateUpdateMixin):
    """
    用户正则表达式配置类
    """

    field_name = models.CharField(_(u'字段名'), max_length=16, blank=True, null=True, help_text=u'字段名')
    regex = models.CharField(_(u'正则表达式值'), max_length=40, blank=True, null=True, help_text=u'正则表达式')
    description = models.CharField(_(u'description'), max_length=40, blank=True, help_text=u'错误描述')

    class Meta:
        verbose_name = _(u'用户信息字段正则表达式')
        verbose_name_plural = _(u'用户信息字段正则表达式')

    def __unicode__(self):
        return self.field_name

    @property
    def data(self):
        return {
            'field_name': self.field_name,
            'regex': self.regex,
            'description': self.description,
        }
