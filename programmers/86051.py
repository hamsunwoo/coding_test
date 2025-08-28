def solution(numbers):
    num = set([i for i in range(0, 10)])
    return sum(num-set(numbers))
