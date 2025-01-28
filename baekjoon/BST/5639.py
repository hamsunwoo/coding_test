##### 시간초과로 다시 풀어야함.
import sys
sys.setrecursionlimit(10**7)

nodes = [int(line.strip()) for line in sys.stdin.readlines()]

class Node:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None

class BSTree:
    def __init__(self):
        self.root = None
    
    def insert(self, key):
        if self.root is None:
            self.root = Node(key)
        else:
            self._insert(self.root, key)
    
    def _insert(self, current_node, key):
        if key < current_node.key:
            if current_node.left is None:
                current_node.left = Node(key)
            else:
                self._insert(current_node.left, key)
        elif key > current_node.key:
            if current_node.right is None:
                current_node.right = Node(key)
            else:
                self._insert(current_node.right, key)


    def postorder(self):
        def post_order(node):
            if node is None:
                return
            post_order(node.left)
            post_order(node.right)
            print(node.key)
        
        post_order(self.root)

tree = BSTree()
for i in nodes:
    tree.insert(i)

tree.postorder()

