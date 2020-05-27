# -*- coding: utf-8 -*-


"""API ERROR"""


class CompetitionError(object):
    CompetitionNotFound = (100001, 'Competition Not Found')
    CompetitionHasEnded = (100002, 'Competition Has Ended')
    CompetitionNotStarted = (100003, 'Competition Not Started')
    BankInfoNotFound = (100004, 'Bank Info Not Found')
    QuestionNotSufficient = (100005, 'Question Not Sufficient')
    QuestionNotFound = (100006, 'Question Not Found')


class ProfileError(object):
    ProfileNotFound = (200001, 'Profile Not Found')


class UserError(object):
    UserNotFound = (300001, 'User Not Found')
    PasswordError = (300002, 'Password Error')
    VeriCodeError = (300003, 'Vericode Error')
    UserHasExists = (300004, 'User Has Exists')
    UserHasSentEmail = (300005, 'User Has Sent Email')
    UserSendEmailFailed = (300006, 'User Send Email Failed')


class SetError(object):
    FileNotFound = (400001, 'File Not Found')
    FileTypeError = (400002, 'File Type Error')
    BankTypeError = (400003, 'Bank Type Error')
    BankInfoNotFound = (400004, 'Bank Info Not Found')


class BizError(object):
    BizAccountExists = (500001, 'Business Account Exists')
    BizAccountNotFound = (500002, 'Business Account Not Found')


"""RENDER ERROR"""


def message(errtitle, errmsg):
    return {"errtitle": errtitle, "errmsg": errmsg}


CompetitionNotFound = message("比赛不存在", "您要找的比赛不存在")
BankInfoNotFound = message("题库不存在", "当前比赛未配置题库")
QuestionLogNotFound = message("比赛记录不存在", "您的答题记录不存在")
CompetitionHasEnded = message("比赛已经结束", "您要参与的比赛已经结束")
CompetitionNotStarted = message("比赛尚未开始", "您要参加的比赛还没开始")
QuestionNotSufficient = message("题目数量过少", "当前题库题目数量过少")
ProfileNotFound = message("用户不存在", "您的账户还没有登录，点击右上角登录吧~")
BizAccountNotFound = message("未注册机构", "只有机构账户才能创建活动，先注册成为机构吧~")
UserNotFound = message("账户不存在", "我们没有找到这个邮箱的账户，密码重置失败")
VeriCodeError = message("校验码错误", "您的校验码出现错误，激活失败")
VeriCodeTimeOut = message("校验码超时", "由于您过长时间未校验邮件，导致校验失败")
VerifyFailed = message("激活失败", "我们没有找到您的注册信息，激活失败")
PasswordResetFailed = message("密码重置失败", "可能因为较长时间未得到确认，您的密码重置失败了!")
TemplateNotFound = message("模板不存在", "题库模板没有找到，请联系管理员~")
FileNotFound = message("文件不存在", "传入的模板为空")
FileTypeError = message("文件类型错误", "传入的文件出错了")
