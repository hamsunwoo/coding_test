from collections import deque

T = int(input())

for _ in range(T):
    N, M = map(int, input().split())
    q = deque(map(int, input().split()))
    q = deque([(i, idx) for idx, i in enumerate(q)])

    cnt = 0

    while True:
        if q[0][0] == max(q, key=lambda x: x[0])[0]:
            cnt += 1

            if q[0][1] == M:
                print(cnt)
                break
            else:
                q.popleft()

        else:
            q.append(q.popleft())
