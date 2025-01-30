def solution(s):
    sum = 0
    
    for i in s:
        if i == '(':
            sum += 1
        elif i == ')':
            sum -= 1
            if sum < 0:
                return False
                break
    
    if sum > 0:
        return False
    else:
        return True
