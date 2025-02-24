def count(arr):
    n = len(arr)
    if n <= 1:
        return 0
    
    mid = n // 2
    left = arr[:mid]
    right = arr[mid:]
    
    inv_count = count(left) + count(right)
    
    i = j = k = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            arr[k] = left[i]
            i += 1
        else:
            arr[k] = right[j]
            j += 1
            inv_count += len(left) - i
        k += 1
    
    while i < len(left):
        arr[k] = left[i]
        i += 1
        k += 1
    
    while j < len(right):
        arr[k] = right[j]
        j += 1
        k += 1
    
    return inv_count

N = int(input())
A = list(map(int, input().split()))

cnt = count(A)
print(cnt)