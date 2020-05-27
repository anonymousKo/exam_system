# -*- coding: utf-8 -*-

from django.conf.urls import url

from account import login_views
from competition import game_views, set_views, rank_views
from business import biz_views
from django.urls import path,re_path

# account
urlpatterns = [
    path('login_normal', login_views.normal_login, name='normal_login'),
    path('login_redirect', login_views.login_redirect, name='index'),
    path('login_vcode', login_views.login_vcode, name='login_qrcode'),
    path('signup', login_views.signup, name='signup'),
    path('sendmail', login_views.sendmail, name='sendmail'),
    path('resetpasswd', login_views.reset_password, name='reset_password'),
]

# game
urlpatterns += [
    path('questions', game_views.get_questions, name='get_questions'),
    path('answer', game_views.submit_answer, name='submit_answer'),
    path('entry', game_views.userinfo_entry, name='userinfo_entry'),
    # re_path('games/s/(\w+)', game_views.games, name='query_games'),
]

# set
urlpatterns += [
    re_path('banks/s/(\d+)', set_views.banks, name='query_banks'),
    re_path('banks/detail/(?P<bank_id>\w+)', set_views.bank_detail, name='bank_detail'),
    path('banks/set', set_views.set_bank, name='set_bank'),
]

# rank
urlpatterns += [
    path('myrank', rank_views.get_my_rank, name='my_rank'),
]

# bussiness
urlpatterns += [
    path('regbiz', biz_views.registry_biz, name='registry biz'),
    path('checkbiz', biz_views.check_biz, name='check_biz'),
]