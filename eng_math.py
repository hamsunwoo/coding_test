import heapq

#N명 중 세명을 골랐을 때
#영어점수 최솟값과 수학점수 최솟값의 합의 최대치를 반환

#영어점수, 수학점수
score = [[56, 71], [80, 57], [91, 27], [14,67], [99, 67]]

eng = []
math = []

for e, m in score:
  heapq.heappush(eng, e)
  heapq.heappush(math, m)

min_eng = heapq.nsmallest(3, eng)
min_math = heapq.nsmallest(3, math)

tmp_score = 0
for eng_score in min_eng:
  for math_score in min_math:
    sum_score = eng_score + math_score
    max_score = max(tmp_score, sum_score)

print(max_score)
