#N명 중 세명을 골랐을 때
#영어점수 최솟값과 수학점수 최솟값의 합의 최대치를 반환

#영어점수, 수학점수
score = [[56, 71], [80, 57], [91, 27], [14,67], [99, 67]]

from itertools import combinations

def solution(score):
    tmp_sum = 0

    for scores in combinations(score, 3):
        min_eng = min([eng[0] for eng in scores])
        min_math = min([math[1] for math in scores])

        score_sum = min_eng + min_math
        max_sum = max(tmp_sum, score_sum)
    
    print(max_sum)
    return max_sum

solution(score)

