def solution(num_list):
    
    even_num = sum(num_list[0:len(num_list):2])
    odd_num = sum(num_list[1:len(num_list):2])
    
    
    return max(even_num, odd_num)
