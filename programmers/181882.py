def solution(arr):
    answer = []
    
    for i in arr:
        if i >= 50 and i % 2 == 0:
            x = i // 2
            answer.append(x)
        elif i < 50 and i % 2 != 0:
            x = i * 2
            answer.append(x)
        else:
            answer.append(i)
    return answer
