from collections import deque

def solution(array, commands):
    answer = []
    queue = deque(commands)

    while queue:
        tmp = queue.popleft()
        i, j, k = tmp[0], tmp[1], tmp[2]

        arr = array[i-1:j]
        
        sorting = sorted(arr)
    
        answer.append(sorting[k-1])
    
    return answer
