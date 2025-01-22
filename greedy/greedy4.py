#백준 거스름돈 문제

n = int(input())
money = 1000 - n

count = 0

coin_type = [500, 100, 50, 10, 5, 1]

for coin in coin_type:
    count += money // coin
    money %= coin

print(count)
