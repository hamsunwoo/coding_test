class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        k = 0  # 유효한 요소 개수

        for i in range(len(nums)):
            if nums[i] != val:
                nums[k] = nums[i]
                k += 1

        return k
