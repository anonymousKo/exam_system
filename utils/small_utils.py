# -*- coding: utf-8 -*-

import datetime


class IntDict(int):
    def __new__(cls, value, *args, **kwargs):
        if isinstance(value, int):
            return {str(value): value}
        return


class String(str):
    """
    Initialize a str object or bytes object to str object
    a = 'I love you'.encode('utf-8')  # bytes type
    b = String(a)
    print(b)  # 'I love you' str type
    """

    def __new__(cls, value, *args, **kwargs):
        if isinstance(value, bytes):
            return value.decode('utf-8')
        return value


def get_today_string():
    now = datetime.datetime.now()
    return str(now.year) + str(now.month) + str(now.day)


def get_now_string(string=''):
    now = datetime.datetime.now()
    str_now = str(now.hour) + str(now.minute) + str(now.second)
    return str_now + '_' + string if string else str_now
