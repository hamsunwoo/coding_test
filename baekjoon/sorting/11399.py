n=int(input())
arr=list(map(int, input().split()))
arr.sort()
tmp = 0

for i in range(len(arr)):
    tmp += arr[i]*n
    n -= 1

print(tmp)
