from collections import deque

def solution(prices):
    stack = []
    que = deque(prices)

    while que:
        count = 0
        x = que.popleft()

        for i in que:
            if x <= i:
                count += 1
            else:
                count += 1
                break
        stack.append(count)
    return stack

                
