def solution(citations):
    answer = 0
    sorting = sorted(citations, reverse = True)
    
    for i, j in enumerate(sorting):
        tmp = i + 1
        
        if tmp <= j:
            answer += 1
        else:
            continue
    return answer
