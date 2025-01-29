import sys
from collections import deque

N, K = map(int, sys.stdin.readline().split())
queue = deque([i for i in range(1, N+1)])

answer = []
cnt = 0

while queue:
    num = queue.popleft()
    cnt += 1

    if cnt == K:
        answer.append(num)
        cnt = 0
    
    else:
        queue.append(num)

print("<", end='')
print(", ".join(map(str, answer)), end='')
print(">")
