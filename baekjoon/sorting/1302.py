arr = [input() for i in range(int(input()))]
dic = dict()

for i in arr:
    if i in dic:
        dic[i] += 1
    else:
        dic[i] = 1

max_count = max(dic.value())
best_seller = [k for k, v in dic.items() if v == max_count]
answer = min(best_seller)
print(answer)
