import sys
from collections import deque

l, n = map(int, sys.stdin.readline().split())

cnt = 0
answer = []
queue = deque([i for i in range(1, l+1)])

while queue:
    num = queue.popleft()
    cnt += 1

    if cnt == n:
        answer.append(num)
        cnt = 0
    else:
        queue.append(num)

print("<", end='')
print(', '.join(map(str, answer)), end='')
print(">")
