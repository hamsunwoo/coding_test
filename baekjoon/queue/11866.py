import sys
from collections import deque

n, m = map(int, sys.stdin.readline().split())
answer = []

lst = deque([i for i in range(1, n+1)])
cnt = 0

while lst:
    num = lst.popleft()
    cnt += 1
    
    if cnt == m:
        answer.append(num)
        cnt = 0
    else:
        lst.append(num)
        
print("<", end='')
print(", ".join(map(str, answer)), end='')
print(">")

