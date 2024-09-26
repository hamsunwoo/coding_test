A = [1, 2, 3] #데이터 집합
N = len(A) #데이터 개수
visited = [0] * N #데이터 사용여부 - 데이터의 index visited[1] = 1
arr = [0] * N #어떤 데이터를 선택했는가 arr[1] = 2

def permutation(level):
    if level >= N:
        print(arr)
        return
    
    for i in range(N):
        if visited[i]: continue
        visited[i] = 1 
        arr[level] = A[i]
        permutation(level+1)
        arr[level] = 0 
        visited[i] = 0 #사용 해제



permutation(0)
