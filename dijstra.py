import heapq

inf = int(1e9)

n, m, start = map(int, input().split())

graph = [[] for _ in range(n+1)]
dist = [inf] * (n + 1) #여기서 거리는 시작노드로부터의 거리를 의미

for _ in range(m):
    a, b, c = map(int, input().split()) #a번 노드에서 b번 노드로 가는 비용이 c
    graph[a].append((b, c))

def dijkstra(start):
    q = []
    heapq.heappush(q, (0, start))
    dist[start] = 0

    while q:
        dist_now, node_now = heapq.heappop(q)

        if dist[node_now] < dist_now:
            continue
        for node, dist in graph[node_now]:
            cost = dist_now + dist

            if cost < dist[node]:
                dist[node] = cost
                heapq.heappush(q, (cost, node))






