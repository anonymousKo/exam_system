# -*- coding: utf-8 -*-

from django.conf.urls import include, url

from competition import cop_render, set_render

from django.urls import path,re_path

# 比赛url
urlpatterns = [
    path('', cop_render.home, name='index'),
    re_path('games/s/(\w+)', cop_render.games, name='query_games'),
    path('game', cop_render.game, name='game'),
    path('result', cop_render.result, name='result'),
    path('rank', cop_render.rank, name='rank'),
    path('search', cop_render.search, name='search'),
    path('contact', cop_render.contact, name='contact'),
    path('donate', cop_render.donate, name='donate'),
]

# 配置比赛url
urlpatterns += [
    path('set', set_render.index, name='set_index'),
    path('set/bank', set_render.set_bank, name='set_bank'),
    path('set/bank/tdownload', set_render.template_download, name='template_download'),
    path('set/bank/upbank', set_render.upload_bank, name='upload_bank'),
    path('set/game', set_render.set_game, name='set_game'),
]
