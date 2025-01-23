n = int(input())
m = list(map(int, input().split()))

# 오름차순 정렬한 리스트를 만든다.
# 내림차순 정렬한 리스트를 만든다.
# 두 리스트 안에 값들을 더한 것을 저장할 리스트를 만든다.
# for문을 돌려서 오름차순, 내림차순 리스트 값을 더한다.
# 값을 리스트에 저장한다.
# 리스트에서 min값만 가져온다.

asc = sorted(m)
desc = sorted(m, reverse=True)

sum_list = []

for i in range(len(m)):
    x = asc[i] + desc[i]
    sum_list.append(x)

print(min(sum_list))

