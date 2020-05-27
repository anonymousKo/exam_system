# -*- coding: utf-8 -*-

from django.contrib import admin

from competition.models import (BankInfo, ChoiceInfo, CompetitionKindInfo,
                                CompetitionQAInfo, FillInBlankInfo)


class CompetitionKindInfoAdmin(admin.ModelAdmin):
    """
    比赛信息后台
    """

    list_display = ('kind_id', 'account_id', 'app_id', 'bank_id', 'kind_name', 'total_score', 'question_num', 'total_partin_num', 'status', 'created_at', 'updated_at')
    list_filter = ('account_id', 'status')
    search_fields = ('kind_name', 'kind_id', 'app_id', 'account_id',)
    readonly_fields = ('kind_id', 'total_partin_num',)

    def save_model(self, request, obj, form, change):
        obj.save()

    def delete_model(self, request, obj):
        obj.delete()

    def get_readonly_fields(self, request, obj=None):
        return self.readonly_fields


class BankInfoAdmin(admin.ModelAdmin):
    """
    题库后台配置
    """

    list_display = ('bank_id', 'bank_type', 'kind_num', 'choice_num', 'fillinblank_num', 'partin_num')
    list_filter = ('bank_type', 'bank_id',)
    search_fields = ('bank_id',)
    readonly_fields = ('bank_id', 'choice_num', 'fillinblank_num', 'kind_num', 'partin_num')

    def save_model(self, request, obj, form, change):
        obj.choice_num = ChoiceInfo.objects.filter(bank_id=obj.bank_id).count()
        obj.fillinblank_num = FillInBlankInfo.objects.filter(bank_id=obj.bank_id).count()
        obj.save()


class ChoiceInfoAdmin(admin.ModelAdmin):
    """
    选择题配置后台
    """

    list_display = ('bank_id', 'question', 'answer', 'item1', 'item2', 'item3', 'item4', 'source', 'status', 'created_at', 'updated_at')
    list_filter = ('bank_id', 'status')
    search_fields = ('bank_id', 'question', 'answer', 'item1', 'item2', 'item3', 'item4')

    def save_model(self, request, obj, form, change):
        obj.save()

    def delete_model(self, request, obj):
        obj.delete()


class FillInBlankInfoAdmin(admin.ModelAdmin):
    """
    填空题配置后台
    """

    list_display = ('bank_id', 'question', 'answer', 'source', 'status', 'created_at', 'updated_at')
    list_filter = ('bank_id', 'status')
    search_fields = ('bank_id', 'question', 'answer')


class CompetitionQAInfoAdmin(admin.ModelAdmin):
    """
    答题记录信息后台
    """

    list_display = ('kind_id', 'status', 'uid', 'qa_id', 'score', 'created_at', 'updated_at')
    list_filter = ('kind_id', 'uid', 'qa_id', 'started', 'finished', 'status')
    search_fields = ('uid', 'kind_id', )
    readonly_fields = ('qa_id',)


admin.site.register(CompetitionKindInfo, CompetitionKindInfoAdmin)
admin.site.register(CompetitionQAInfo, CompetitionQAInfoAdmin)
admin.site.register(ChoiceInfo, ChoiceInfoAdmin)
admin.site.register(FillInBlankInfo, FillInBlankInfoAdmin)
admin.site.register(BankInfo, BankInfoAdmin)
