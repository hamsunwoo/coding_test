import heapq

n = int(input())
hq = []

for i in range(n):
    d, w = map(int, input().split())
    heapq.heappush(hq,(-w, d))

assigned = [False] * 1001
score = 0

while hq:
    w, d = heapq.heappop(hq)
    w = -w
    
    for i in range(d, 0, -1):
        if assigned[i]:
            continue
        assigned[i] = True
        score += w
        break
print(score)
    
