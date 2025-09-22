def solution(n):
    tmp = int(n ** 0.5)
    
    if tmp * tmp == n:
        return (tmp + 1) ** 2
    else:
        return -1
