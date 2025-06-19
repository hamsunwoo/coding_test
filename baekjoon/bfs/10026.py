from collections import deque

N = int(input())
graph = [list(input().strip()) for _ in range(N)]

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

def bfs(x, y, color, visited, graph):
    queue = deque()
    queue.append((x, y))
    visited[x][y] = True

    while queue:
        cx, cy = queue.popleft()
        
        for i in range(N):
            nx = cx + dx[i]
            ny = cy + dy[i]

            if 0 <= nx < N and 0 <= ny < N and not visited[nx][ny]:
                if graph[nx][ny] == color:
                    visited[nx][ny] = True
                    queue.append((nx, ny))

visited_normal = [[False] * N for _ in range(N)]
count_normal = 0

for i in range(N):
    for j in range(N):
        if not visited_normal[i][j]:
            bfs(i, j, graph[i][j], visited_normal, graph)
            count_normal += 1

graph_colorblind = [row[:] for row in graph]
for i in range(N):
    for j in range(N):
        if graph_colorblind[i][j] == 'G':
            graph_colorblind[i][j] = 'R'

visited_cb = [[False] * n for _ in range(N)]
count_cb = 0

for i in range(N):
    for j in range(N):
        if not visited_cb[i][j]:
            bfs(i, j, graph_colorblind[i][j], visited_cb, graph_colorblind)
            count_cb += 1

print(count_normal, count_cb)




