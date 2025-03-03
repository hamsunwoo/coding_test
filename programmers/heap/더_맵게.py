import heapq

def solution(scoville, K):
    heapq.heapify(scoville)
    answer = 0

    while len(scoville) > 1:
        f = heapq.heappop(scoville)
        if f >= K:
            break

        s = heapq.heappop(scoville)
        formula = f + (s*2)

        heapq.heappush(scoville, formula)
        answer += 1

    return answer if scoville[0] >= K else -1
