def solution(clothes):
    answer = 1
    dic = {}
    
    
    for value, key in clothes:
        dic.setdefault(key, []).append(value)
        
    for tmp in dic.values():
        n = len(tmp) + 1
        answer *= n
    
    return answer - 1
