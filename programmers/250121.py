def solution(data, ext, val_ext, sort_by):
    answer = []
    dic = {'code': 0, 'date': 1, 'maximum': 2, 'remain': 3}
    
    for i in data:
        if i[dic[ext]] < val_ext:
            answer.append(i)

    return sorted(answer, key=lambda x: x[dic[sort_by]])
