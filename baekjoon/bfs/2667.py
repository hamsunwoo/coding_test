from collections import deque

N = int(input())

graph = []

for _ in range(N):
    graph.append(list(map(int, input())))

def BFS(x, y, graph):
    count = 1
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    queue = deque()
    queue.append((x, y))
    graph[x][y] = 0

    while queue:
        x, y = queue.popleft()

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            if 0 <= nx < N and 0 <= ny < N and graph[nx][ny] == 1:
                graph[nx][ny] = 0
                queue.append((nx, ny))
                count += 1

    return count

cnt = []
for i in range(N):
    for j in range(N):
        if graph[i][j] == 1:
            cnt.append(BFS(i, j, graph))

cnt.sort()
print(len(cnt))
for i in range(len(cnt)):
    print(cnt[i])
