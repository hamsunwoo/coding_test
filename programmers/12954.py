def solution(x, n):
    answer = []
    
    for num in range(1, n+1):
        answer.append(num*x)
        
    return answer
