class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        dic, start, answer = {}, 0, 0
        n = len(s)

        for i in range(n):
            if s[i] in dic:
                start = max(start, dic[s[i]]+1)
            dic[s[i]] = i
            answer = max(answer, i - start + 1)
        
        return answer
