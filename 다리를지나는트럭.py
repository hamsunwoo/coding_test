def solution(bridge_length, weight, truck_weights):
    time = 0
    p = list(truck_weights)
    bridge = [0] * bridge_length
    w = 0 #다리를 지나는 트럭 총 무게

    while bridge:
        time += 1
        w -= bridge.pop(0)

        if p:
            if (w + p[0]) <= weight:
                w += p[0]
                bridge.append(p.pop(0))

            else:
                bridge.append(0)
    return time

