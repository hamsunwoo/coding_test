def solution(food):
    answer = ''
    
    for i in range(1, len(food)):
        num = str((food[i] // 2)*str(i))
        answer += num
    
    return answer + '0' + answer[::-1]
