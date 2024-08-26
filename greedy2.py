#배열이 있을 때 주어진 수들을 M번 더하기
M = 8

#단 배열의 특정한 인덱스에 해당하는 수가 연속해서 K번을 초과할 수 X
K = 3

#배열
arr = [2, 4, 5, 4, 6]
arr = sorted(arr, reverse = True)

#더할곳 
tmp = 0

#tmp 리스트 길이는 절대 M을 넘을 수 없다.
while True:
    #참일때 가장 큰 수를 k값만큼 넣을거다.
    for i in range(K):
        if M == 0:
            break

        tmp += arr[0]
        M -= 1

    if M == 0:
        break
    #K값만큼 넣었으면 그 다음 큰수 한번 넣는다.
    tmp += arr[1]
    M -= 1

print(tmp)
