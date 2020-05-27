# -*- coding: utf-8 -*-

from utils.redis.constants import KEY_PREFIX


# Quote/UnQuote Section
def __quote_key(self, name):
    return '{0}quote:{1}'.format(KEY_PREFIX, name)


def quote(self, s, ex=True, time=1800, short_uuid=False):
    identifier = self.__uuid(short_uuid)
    identifier_key = self.__quote_key(identifier)
    self.setex(identifier_key, time, s) if ex else self.set(identifier_key, s)
    return identifier


def unquote(self, identifier, buf=False):
    identifier_key = self.__quote_key(identifier)
    return self.get(identifier_key) if buf else self.get_delete(identifier_key)[0]
