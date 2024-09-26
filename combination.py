#N개 데이터에서 k개 데이터 뽑기
#level: 몇번째 선택을 하는 것인가!
N = 5
k = 2
arr = [0] * k
A = [1, 2, 3, 4, 5]

def combi(level, S):
    #종료조건
    if level == k:
        print(arr)
        return
    
    for i in range(S, N-k+level+1): #
        arr[level] = A[i]
        combi(level+1, i+1)

combi(0, 0)
