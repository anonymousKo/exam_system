# -*- coding: utf-8 -*-

"""

picture code generator: reference from web blog;

"""

import random

from PIL import Image, ImageDraw, ImageFilter, ImageFont


class CodeGen(object):
    def __init__(self, text_str=None, size=None, background=None):
        """
        text_str: 验证码显示的字符组成的字符串
        size:  图片大小
        background: 背景颜色
        """

        self.text_str = text_str or '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        self.size = size or (150, 50)
        self.background = background or 'white'
        self.text_list = list(self.text_str)

    def create_pic(self):
        """
        创建一张图片
        """

        self.width, self.height = self.size
        self.img = Image.new("RGB", self.size, self.background)
        # 实例化画笔
        self.draw = ImageDraw.Draw(self.img)

    def create_point(self, num, color):
        """
        num: 画点的数量
        color: 点的颜色
        功能：画点
        """

        for i in range(num):
            self.draw.point(
                (random.randint(0, self.width), random.randint(0, self.height)),
                fill=color
            )

    def create_line(self, num, color):
        """
        num: 线条的数量
        color: 线条的颜色
        功能：画线条
        """

        for i in range(num):
            self.draw.line(
                [
                    (random.randint(0, self.width), random.randint(0, self.height)),
                    (random.randint(0, self.width), random.randint(0, self.height))
                ],
                fill=color
            )

    def create_text(self, font_type, font_size, font_color, font_num, start_xy):
        """
        font_type: 字体
        font_size: 文字大小
        font_color: 文字颜色
        font_num:  文字数量
        start_xy:  第一个字左上角坐标,元组类型，如 (5,5)
        功能： 画文字
        """

        font = ImageFont.truetype(font_type, font_size)
        check = random.sample(self.text_list, font_num)
        self.draw.text(start_xy, " ".join(check), font=font, fill=font_color)
        return check

    def opera(self):
        """
        功能：给画出来的线条，文字，扭曲一下，缩放一下，位移一下，滤镜一下。
        就是让它看起来有点歪，有点扭。
        """

        params = [
            1 - float(random.randint(1, 2)) / 100,
            0,
            0,
            0,
            1 - float(random.randint(1, 10)) / 100,
            float(random.randint(1, 2)) / 500,
            0.001,
            float(random.randint(1, 2)) / 500
        ]
        self.img = self.img.transform(self.size, Image.PERSPECTIVE, params)
        self.img = self.img.filter(ImageFilter.EDGE_ENHANCE_MORE)


def get_pic_code():
    __cg = CodeGen()
    __cg.create_pic()
    __cg.create_point(500, (220, 220, 220))
    __cg.create_line(30, (220, 220, 220))
    __check = __cg.create_text("web/static/font/simsun.ttc", 24, (0, 0, 205), 4, (7, 7))
    __cg.opera()

    return __cg.img, __check
