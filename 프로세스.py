from collections import deque

def solution(priorities, location):
    answer = 0
    q = deque([(i, j) for i, j in enumerate(priorities)])

    while q:
        max_priority = max(q, key=lambda x: x[0])[0]
        current = q.popleft()

        if current[0] == max_priority:
            answer += 1
            
            if current[1] == location:
                return answer

        else:
            q.append(current)
    return answer
