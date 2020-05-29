# MySQL配置
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'exam_system',
        'USER': 'root',
        'PASSWORD': ''
    }
}
# Redis配置
REDIS = {
    'default': {
        'HOST': '127.0.0.1',
        'PORT': 6379,
        'USER': '',
        'PASSWORD': '',
        'db': 0,
    }
}
BANK_REPO = 'C:\\Users\\KSX\\Desktop\\Code\\20\\Exam\\backup'  # 修改为存放excel题库的位置，用来保留题库
BASE_NUM_ID = 100000
INIT_PASSWORD = 'p@ssw0rd'
DOMAIN = "http://xxx.xx.xx.xxx"  #### 需要修改此处域名
WEB_INDEX_URI = "{}/web/index".format(DOMAIN)  # 首页

# 发送邮件
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'  # 邮箱验证后台
EMAIL_USE_TLS = True  # 使用TSL
EMAIL_USE_SSL = False  # 使用SSL
EMAIL_SSL_CERTFILE = None  # SSL证书
EMAIL_SSL_KEYFILE = None  # SSL文件
EMAIL_TIMEOUT = None  # 延时
EMAIL_HOST = 'smtp.qq.com' #SMTP地址
EMAIL_PORT = 25  # 端口
EMAIL_HOST_USER = '1349287928@qq.com'  # 发件邮箱
EMAIL_HOST_PASSWORD = 'ymrjpzlqjtgogafd'  # 密码
SERVER_EMAIL = EMAIL_HOST_USER  # 服务器邮箱
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER  # 默认发件人
ADMINS = [('Admin', 'xxx@xxx.xx')]  # 管理员邮箱

MANAGERS = ADMINS
