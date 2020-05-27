"""exam URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path

from account import login_render

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', login_render.web_index, name='web_index'),
    path('index', login_render.web_index, name='web_index'),
    path('login', login_render.web_login, name='web_login'),
    path('logout', login_render.web_logout, name='web_logout'),
]

urlpatterns += [
    path('bs/', include(('competition.urls','competition'), namespace='bs')),  # 比赛
    path('api/', include(('api.urls','api'), namespace='api')),  # 接口
    path('biz/', include(('business.urls','business'), namespace='biz')),  # 机构
]

urlpatterns += [
    path('auth/', include(('account.urls','account'), namespace='auth')),
]

handler403 = login_render.error
handler404 = login_render.error
handler500 = login_render.error

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = "[智慧校园测评系统]"
