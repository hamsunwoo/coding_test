def solution(my_string):
    answer = [0] * 52
    for i in my_string:
        if ord(i) < 97:
            num = ord(i) - 65
            answer[num] += 1
        else:
            num = ord(i) - 97+26
            answer[num] += 1
    return answer
