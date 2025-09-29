def solution(price, money, count):
    num = price * count
    answer = num - money
    
    while num != 0:
        num = num - price
        answer += num
    
    return answer if answer > 0 else 0
