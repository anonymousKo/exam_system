# -*- coding: utf-8 -*-

import urllib.request

import requests

"""
AUTHORIZE_URI: 微信授权链接
QRCODE_AUTHORIZE_URI: 二维码授权链接
ACCESSTOKEN_URI: 获取access_token链接
USERINFO_URI: 获取用户信息链接
LOGIN_JSAPI: 登录用JS API
"""


API_DOMAIN = 'https://api.weixin.qq.com'
OPEN_DOMAIN = 'https://open.weixin.qq.com'
MCH_DOMAIN = 'https://api.mch.weixin.qq.com'
AUTHORIZE_URI = OPEN_DOMAIN + '/connect/oauth2/authorize?appid={appid}&redirect_uri={redirect_uri}&response_type=code&scope={scope}&state={state}#wechat_redirect'
QRCODE_AUTHORIZE_URI = OPEN_DOMAIN + 'https://open.weixin.qq.com/connect/qrconnect?appid={appid}&redirect_uri={redirect_uri}&response_type=code&scope={scope}&state={state}#wechat_redirect'
ACCESSTOKEN_URI = API_DOMAIN + '/sns/oauth2/access_token?appid={appid}&secret={secret}&code={code}&grant_type=authorization_code'
USERINFO_URI = API_DOMAIN + '/sns/userinfo?access_token={access_token}&openid={openid}'
LOGIN_JSAPI = 'http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js'


class Oauth(object):
    def __init__(self, authorize_uri=None, accesstoken_uri=None, userinfo_uri=None, qrcode_authorize_uri=None):
        self.WECHAT_OAUTH2_AUTHORIZE = authorize_uri or AUTHORIZE_URI
        self.WECHAT_OAUTH2_ACCESS_TOKEN = accesstoken_uri or ACCESSTOKEN_URI
        self.WECHAT_OAUTH2_USERINFO = userinfo_uri or USERINFO_URI
        self.WECHAT_QRCODE_AUTHORIZE = qrcode_authorize_uri or QRCODE_AUTHORIZE_URI

    def get(self, url, verify=False, encoding='utf-8', res_to_encoding=True, res_to_json=True, res_processor_func=None, resjson_processor_func=None, **kwargs):
        # When ``verify=True`` and ``cacert.pem`` not match ``https://xxx.weixin.qq.com``, will raise
        # SSLError: [Errno 1] _ssl.c:510: error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
        res = requests.get(url.format(**kwargs), verify=verify)
        if res_to_encoding:
            res.encoding = encoding
        if res_processor_func:
            return res_processor_func(res)
        if not res_to_json:
            return res
        resjson = res.json()
        return resjson_processor_func(resjson) if resjson_processor_func else resjson

    def get_oauth_code_url(self, appid=None, redirect_uri=None, scope='snsapi_base', redirect_url=None):
        return self.WECHAT_OAUTH2_AUTHORIZE.format(
            appid=appid,
            redirect_uri=urllib.request.quote(redirect_uri),
            scope=scope,
            state=urllib.request.quote(redirect_url)
        )

    def get_access_info(self, appid=None, secret=None, code=None):
        return self.get(self.WECHAT_OAUTH2_ACCESS_TOKEN, appid=appid, secret=secret, code=code)

    def get_userinfo(self, access_token=None, openid=None):
        return self.get(self.WECHAT_OAUTH2_USERINFO, access_token=access_token, openid=openid)

    def get_oauth_redirect_url(self, oauth_uri, scope='snsapi_base', redirect_url=None, default_url=None, direct_redirect=None):
        """
        # https://a.com/wx/oauth2?redirect_url=redirect_url
        # https://a.com/wx/oauth2?redirect_url=redirect_url&default_url=default_url
        # https://a.com/wx/oauth2?scope=snsapi_base&redirect_url=redirect_url
        # https://a.com/wx/oauth2?scope=snsapi_base&redirect_url=redirect_url&default_url=default_url
        # https://a.com/wx/oauth2?scope=snsapi_base&redirect_url=redirect_url&default_url=default_url&direct_redirect=true
        """
        oauth_url = oauth_uri.format(scope, urllib.request.quote(redirect_url), urllib.request.quote(default_url)) if default_url else oauth_uri.format(scope, urllib.request.quote(redirect_url))
        return '{0}&direct_redirect=true'.format(oauth_url) if direct_redirect else oauth_url


oauth = Oauth()
get_oauth_code_url = oauth.get_oauth_code_url
get_access_info = oauth.get_access_info
get_userinfo = oauth.get_userinfo
get_oauth_redirect_url = oauth.get_oauth_redirect_url
