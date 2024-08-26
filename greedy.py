#거스름돈 문제

#문제에서 주어진 거스름돈 단위를 리스트에 담는다.
change = [500, 100, 50, 10]

#거슬러줘야 할 동전의 최소 개수이니 change 리스트를 오름차순으로 정렬
change = sorted(change, reverse = True)

#문제에서 거슬러 줘야 할 돈 N = 1260
N = 1260

#개수를 카운트할 count 변수
count = 0

#거슬러줘야 할 돈은 10의 배수이니 change와 계속 나눈다. N이 0이 될 때까지
for i in change:
    count += (N // i)
    N = N % i
print(count)

    



