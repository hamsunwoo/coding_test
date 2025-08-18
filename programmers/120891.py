def solution(order):
    answer = 0
    num_list = str(order)
    for i in num_list:
        if i == '3' or i == '6' or i == '9':
            answer += 1
    return answer
