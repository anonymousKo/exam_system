# -*- coding: utf-8 -*-

from django.contrib import admin

from business.models import (AppConfigInfo, BusinessAccountInfo,
                             BusinessAppInfo, UserInfoImage, UserInfoRegex)
from utils.redis.rpageconfig import set_pageconfig, set_form_regex, rem_form_regex


class BusinessAccountInfoAdmin(admin.ModelAdmin):
    """
    商家账户后台
    """

    list_display = ('account_id', 'email', 'company_name', 'company_description', 'company_username', 'company_phone', 'company_location', 'status', 'created_at', 'updated_at')
    list_filter = ('account_id', 'status')
    readonly_fields = ('account_id',)


class BusinessAppInfoAdmin(admin.ModelAdmin):
    """
    App信息后台
    """

    list_display = ('account_id', 'app_id', 'app_name', 'app_description', 'status', 'created_at', 'updated_at')
    list_filter = ('account_id', 'app_id', 'status')
    readonly_fields = ('app_id',)


class AppConfigInfoAdmin(admin.ModelAdmin):
    """
    App具体配置后台
    """

    list_display = ('app_id', 'app_name', 'status', 'created_at', 'updated_at')
    search_fields = ('app_id', 'app_name')
    fieldsets = (
        ('None', {
            'fields': ('app_id', 'app_name',)
        }),
        (u'文案配置', {
            'classes': ('collapse',),
            'fields': (
                'rule_text',
            ),
        }),
        (u'显示信息相关', {
            'classes': ('collapse',),
            'fields': (
                'is_show_userinfo', 'userinfo_fields', 'userinfo_field_names', 'option_fields',)
        }),
    )

    def save_model(self, request, obj, form, change):
        obj.save()
        set_pageconfig(obj.data)


class UserInfoImageAdmin(admin.ModelAdmin):
    """
    用户表单图片配置后台
    """

    list_display = ('uii_name', 'status', 'created_at', 'updated_at')

    def save_model(self, request, obj, form, change):
        obj.save()


class UserInfoRegexAdmin(admin.ModelAdmin):
    """
    用户表单正则表达式配置后台
    """

    list_display = ('field_name', 'regex', 'description', 'status', 'created_at', 'updated_at')
    list_filter = ('field_name',)

    def save_model(self, request, obj, form, change):
        set_form_regex(obj.field_name, obj.data)
        obj.save()

    def delete_model(self, request, obj):
        rem_form_regex(obj.field_name)
        obj.delete()


admin.site.register(BusinessAccountInfo, BusinessAccountInfoAdmin)
admin.site.register(BusinessAppInfo, BusinessAppInfoAdmin)
admin.site.register(AppConfigInfo, AppConfigInfoAdmin)
admin.site.register(UserInfoImage, UserInfoImageAdmin)
admin.site.register(UserInfoRegex, UserInfoRegexAdmin)
