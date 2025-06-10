import sys
input = sys.stdin.readline

n = int(input().strip())
arr = []

for i in range(n):
    arr.append(input().strip())

tmp = list(set(arr))
sorted_strings = sorted(tmp, key=lambda x: (len(x), x))

for i in sorted_strings:
    print(i)
