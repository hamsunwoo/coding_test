def solution(myString, pat):
    string = myString.lower()
    pat = pat.lower()
    
    if pat in string:
        return 1
    else:
        return 0
