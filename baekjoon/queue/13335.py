n, w, l = map(int, input().split())
t = list(map(int, input().split()))

time = 0
bridge = [0] * w
total_weight = 0

while bridge:
    time += 1
    total_weight -= bridge.pop(0)

    if t:
        if (total_weight + t[0]) <= l:
            total_weight += t[0]
            bridge.append(t.pop(0))
        else:
            bridge.append(0)

print(time)
