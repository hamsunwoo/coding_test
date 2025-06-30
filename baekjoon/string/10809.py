S = input()
string = 'abcdefghijklmnopqrstuvwxyz'

for i in string:
    if i in S:
        print(S.index(i), end =' ')
    else:
        print(-1, end=' ')
