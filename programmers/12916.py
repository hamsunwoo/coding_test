def solution(s):
    answer = 0

    tmp = s.lower()
    
    for i in tmp:
        if i == 'p':
            answer += 1
        elif i == 'y':
            answer -= 1
    
    if answer == 0:
        return True
    else:
        return False
