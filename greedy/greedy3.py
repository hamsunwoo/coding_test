#숫자 카드 게임

#행 n 열 m
n, m = 3, 3

#랜덤카드
card = [[3, 1, 2], [4, 1, 4], [2, 2, 2]]

#가장 작은 숫자 중 가장 큰 숫자를 출력

#min_num을 넣어줄 빈 리스트 생성
tmp = []

#card를 for문돌려 가장 작은 숫자 뽑아내기
for i in card:
    min_num = min(i)
    tmp.append(min_num)

#가장 큰 값 출력
print(max(tmp))
