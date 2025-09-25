def solution(n, m):
    a, b = n, m
    while b:
        a, b = b, a % b
    gcd_val = a

    lcm_val = (n * m) // gcd_val 

    return [gcd_val, lcm_val]

