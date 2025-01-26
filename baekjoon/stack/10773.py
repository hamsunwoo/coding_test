import sys

N = int(input())
answer = []

for _ in range(N):
    num = int(sys.stdin.readline())
    if answer and num == 0:
        answer.pop()
    else:
        answer.append(num)
print(sum(answer))
