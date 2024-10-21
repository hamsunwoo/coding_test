#N명 중 세명을 골랐을 때
#영어점수 최솟값과 수학점수 최솟값의 합의 최대치를 반환

#영어점수, 수학점수
score = [[56, 71], [80, 57], [91, 27], [14,67], [99, 67]]
n = 5

def solution(score, n):
    eng_score = [eng for eng, math in score]
    math_score = [math for eng, math in score]

    eng_score.sort(reverse=True)
    math_score.sort(reverse=True)
    print(min(eng_score[:3]) + min(math_score[:3]))
    return min(eng_score[:3]) + min(math_score[:3])

solution(score, n)
