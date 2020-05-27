# -*- coding: utf-8 -*-
from django.contrib import admin

from account.models import Profile, UserInfo
from utils.redis.rprofile import delete_profile, set_profile


class ProfileAdmin(admin.ModelAdmin):
    """
    用户信息后台配置
    """

    list_display = ('uid', 'user_src', 'unionid', 'nickname', 'sex', 'country', 'province', 'city', 'is_upgrade', 'upgrade_time', 'expire_time', 'upgrade_count', 'status', 'created_at', 'updated_at')
    list_filter = ('is_upgrade', 'sex', 'status')
    search_fields = ('uid', 'nickname')
    readonly_fields = ('uid',)

    def save_model(self, request, obj, form, change):
        obj.save()
        set_profile(obj.data)

    def delete_model(self, request, obj):
        delete_profile(obj.uid)
        obj.delete()


class UserInfoAdmin(admin.ModelAdmin):
    """
    用户填写表单信息后台配置
    """

    list_display = ('kind_id', 'uid', 'name', 'sex', 'phone', 'wxid', 'status', 'created_at', 'updated_at')
    list_filter = ('kind_id', 'status')
    readonly_fields = ('kind_id', 'uid')
    search_fields = ('kind_id', 'name')


admin.site.register(Profile, ProfileAdmin)
admin.site.register(UserInfo, UserInfoAdmin)
