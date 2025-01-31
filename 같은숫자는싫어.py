from collections import deque

def solution(arr):
    answer = []
    q = deque(arr)
    
    while q:
        num = q.popleft()
        if len(answer) == 0:
            answer.append(num)
        if num == answer[-1]:
            continue
        answer.append(num)
    
    return answer
