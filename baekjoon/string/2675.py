N = int(input())

for _ in range(N):
    cnt, word = input().split()
    for i in word:
        print(i*int(cnt), end='')
    print()
