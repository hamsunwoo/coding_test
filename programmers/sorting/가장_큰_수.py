def solution(numbers):
    
    sorta = sorted([str(i) for i in numbers], reverse = True)
    sorta.sort(key = lambda x: x*3, reverse = True)
    
    if len(sorta) != sorta.count('0'):
        return ''.join(sorta)
    else:
        return '0'
