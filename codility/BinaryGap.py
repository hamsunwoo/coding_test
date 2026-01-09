def solution(N):
    binary = bin(N)[2:]  # 이진수 문자열로 변환
    max_gap = 0
    current_gap = 0
    started = False 

    for bit in binary:
        if bit == '1':
            if started:
                max_gap = max(max_gap, current_gap)
            started = True
            current_gap = 0
        else:  # bit == '0'
            if started:
                current_gap += 1

    return max_gap

