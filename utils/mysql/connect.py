# -*- coding: utf-8 -*-

"""

MySQL Db Connector:
Instantiaze ConnectDb class
Parameters for ConnectDB's __init__ function should be a python dict:
{
  'HOST': 'localhost',
  'USER': 'root',
  'PASSWORD': '',
  'NAME': '',
}
ConnectDb class got two functions: connector,dict_cursor
ConnectDbInstance.connector returns a database connector
ConnectDbInstance.dict_cursor returns database cursor with DictCursorClass
You can use cursor.execute() or cursor.execute_many() to operating database
You can use cursor.fetchone() or cursor.fetchall() to get latest queies from database

"""

from django.conf import settings

import pymysql


def mysql_conf(conf):
    return {
        'host': conf.get('HOST', 'localhost'),
        'user': conf.get('USER', 'root'),
        'passwd': conf.get('PASSWORD', ''),
        'database': conf.get('NAME', 'exam'),
        'port': conf.get('PORT', 3306),
    }


class ConnectDb(object):
    def __init__(self, conf={}):
        self.__conf = conf

    def connector(self):
        try:
            conn = pymysql.connect(**mysql_conf(self.__conf))
        except pymysql.err.OperationalError as e:
            raise e

        return conn

    def dict_cursor(self):
        return self.connector().cursor(cursor=pymysql.cursors.DictCursor)


connect = ConnectDb(settings.DATABASES.get('default', {}))
connection = connect.connector()
dict_cursor = connect.dict_cursor()
