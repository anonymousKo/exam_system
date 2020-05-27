# -*- coding: utf-8 -*-

from competition.models import ChoiceInfo, FillInBlankInfo


def check_correct_num(rlist):
    if isinstance(rlist, list):
        total = len(rlist)
        correct = 0
        correct_list = []
        wrong_list = []
        for i in rlist:
            if isinstance(i, str):
                i = i.split(',')
                t = i[0][0]  # qtype
                p = i[0][2:]  # pk
                v = i[1]  # answer

                # 转换类型
                try:
                    pk = int(p)
                except ValueError:
                    continue
                # 判断题目类型
                if t == 'c':
                    try:
                        c = ChoiceInfo.objects.get(pk=pk)
                    except ChoiceInfo.DoesNotExist:
                        continue

                    if "A" in v:
                        if str(c.item1) == str(c.answer):
                            correct += 1
                            correct_list.append(i)
                    elif "B" in v:
                        if str(c.item2) == str(c.answer):
                            correct_list.append(i)
                            correct += 1
                    elif "C" in v:
                        if str(c.item3) == str(c.answer):
                            correct += 1
                            correct_list.append(i)
                    elif "D" in v:
                        if str(c.item4) == str(c.answer):
                            correct += 1
                            correct_list.append(i)
                    else:
                        wrong_list.append(i)

                if t == 'f':
                    try:
                        f = FillInBlankInfo.objects.get(pk=pk)
                    except FillInBlankInfo.DoesNotExist:
                        continue

                    if v.strip() == f.answer:
                        correct += 1

        wrong = total - correct

        return total, correct, wrong, correct_list, wrong_list

    return 0, 0, 0, [], []
