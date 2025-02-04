from collections import deque

N = int(input()) 
tmp = deque([i for i in range(1, N+1)])
answer = []
cnt = 1

while tmp:
    if cnt % 2 > 0:
        answer.append(tmp[0])
        tmp.popleft()
    else:
        tmp.append(tmp[0])
        tmp.popleft()
    cnt += 1
    
print(*answer)
