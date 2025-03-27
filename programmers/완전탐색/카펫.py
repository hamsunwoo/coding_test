import math

def solution(brown, yellow):
    x = 0.5 * ((2 + brown / 2) + math.sqrt((2 + brown / 2) ** 2 - 4 * (brown + yellow)))
    y = brown / 2 - x + 2
    
    return [x, y]
