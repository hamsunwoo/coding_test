N = int(input())

for _ in range(N):
    data = input()
    data_ls = list(data)
    
    # sum 이라는 값에 0을 선언한다.
    #'('이면 sum에 +1을 해준다.
    #')'이면 sum에 -1을 해준다.
    #sum이 0이면 'YES' 출력한다.
    #sum이 0보다 크거나 작으면 'NO'를 출력한다.

    sum = 0

    for i in data_ls:
        if i == "(":
            sum += 1

        elif i == ")":
            sum -= 1
            if sum < 0:
                print("NO")
                break

    if sum > 0:
        print("NO")

    elif sum == 0:
        print("YES")
