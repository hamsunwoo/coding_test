def solution(l, r):
    answer = []
    
    exception = set(['1','2','3','4','6','7','8','9'])
    
    for i in range(l, r+1):
        num = set(str(i))

        if num & exception:
            pass
        else:
            answer.append(i)

    if len(answer) == 0 :
        answer.append(-1)

    answer = sorted(answer)
    return answer
