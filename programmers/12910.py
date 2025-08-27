def solution(arr, divisor):
    answer = []
    tmp = []
    for i in arr:
        if i % divisor == 0:
            tmp.append(i)
    
    if len(tmp) == 0:
        answer.append(-1)
        return answer
    else:
        return sorted(tmp)
