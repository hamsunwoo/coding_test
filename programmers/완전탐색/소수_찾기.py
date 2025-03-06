from itertools import permutations

def solution(numbers):
    answer = 0
    
    def is_prime(n):
        if n < 2:
            return False
        for i in range(2, int(n ** 0.5) + 1):
            if n % i == 0:
                return False
        return True
    
    unique_primes = set()  # 중복 방지를 위한 집합

    for length in range(1, len(numbers) + 1):  # 1자리 ~ 전체 숫자 길이까지 고려
        for perm in permutations(numbers, length):  # 모든 순열 생성
            if perm[0] == 0:  # 0으로 시작하는 숫자는 제외
                continue
            num = int(''.join(map(str, perm)))  # 리스트 -> 문자열 -> 정수 변환
            if is_prime(num):
                unique_primes.add(num)  # 소수이면 추가

    answer += len(unique_primes)
    return answer
