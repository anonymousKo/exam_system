# -*- coding: utf-8 -*-

import re

from django.utils.deprecation import MiddlewareMixin


class ConstExtendIntField(int):
    def __new__(cls, flag, version=''):
        obj = int.__new__(cls, flag)
        obj.version = version
        return obj


class UserAgentDetectionMiddleware(MiddlewareMixin):

    def process_request(self, request):
        ua = request.META.get('HTTP_USER_AGENT', '').lower()

        # ####### Device、OS #######
        # Windows
        request.Windows = 'windows nt' in ua
        # Linux
        request.Linux = 'linux x86_64' in ua
        # iMac、iPhone、iPad、iPod
        request.iMac, request.iPhone, request.iPad, request.iPod = 'macintosh' in ua, 'iphone' in ua, 'ipad' in ua, 'ipod' in ua
        # PC
        request.PC = request.Windows or request.Linux or request.iMac
        # iOS
        request.iOS = request.iPhone or request.iPad or request.iMac or request.iPod
        # Android and Version
        adr = re.findall(r'android ([\d.]+)', ua)
        request.Android = ConstExtendIntField(True, adr[0]) if adr else ConstExtendIntField('android' in ua, '')

        # ####### APP #######
        # Weixin/Wechat and Version
        wx = re.findall(r'micromessenger[\s/]([\d.]+)', ua)
        request.weixin = request.wechat = ConstExtendIntField(True, wx[0]) if wx else ConstExtendIntField(False, '')

        return None
