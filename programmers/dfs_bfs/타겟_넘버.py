from collections import deque

def solution(numbers, target):
    queue = deque([(0,0)])
    answer = 0

    while queue:
        current_sum, idx = queue.popleft()

        if idx == len(numbers):
            if current_sum == target:
                answer += 1


        else:
            queue.append((current_sum + numbers[idx], idx + 1))
            queue.append((current_sum - numbers[idx], idx + 1))

    return answer
