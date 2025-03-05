from collections import deque

def listnode_to_deque(node):
    q = deque()
    while node:
        q.append(node.val)
        node = node.next
    return q

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        
        
        q1 = listnode_to_deque(l1)
        q2 = listnode_to_deque(l2)      

        answer = deque()
        tmp = 0
        
        while q1 or q2 or tmp:
            n = q1.popleft() if q1 else 0
            m = q2.popleft() if q2 else 0
            sum_num = n + m + tmp
            tmp = sum_num // 10
            answer.append(sum_num % 10)

        # deque를 ListNode로 변환
        answer.reverse()
        head = ListNode(answer.pop())  # 첫 번째 값을 head로 설정
        current = head
        while answer:
            current.next = ListNode(answer.pop())  # 다음 노드를 연결
            current = current.next

        return head  # ListNode 형태로 반환

