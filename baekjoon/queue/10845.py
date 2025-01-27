import sys

class Queue:
    def __init__(self):
        self.items = []
    
    def enqueue(self, value):
        self.items.append(value)

    def empty(self):
        if len(self.items) == 0:
            return 1
        else:
            return 0

    def dequeue(self):
        if self.empty():
            return None
        return self.items.pop(0)

    def size(self):
        return len(self.items)

    def front(self):
        if self.empty():
            return None
        else:
            return self.items[0]

    def back(self):
        if self.empty():
            return None
        else:
            return self.items[-1]

N = int(sys.stdin.readline())
queue = Queue()

for _ in range(N):
    command = sys.stdin.readline().strip().split()

    if command[0] == "push" and len(command) > 1:
        queue.enqueue(int(command[1]))

    elif command[0] == "pop":
        print(queue.dequeue() if queue.size() > 0 else -1)

    elif command[0] == "size":
        print(queue.size())

    elif command[0] == "empty":
        print(queue.empty())

    elif command[0] == "front":
        if queue.front():
            print(queue.front())
        else:
            print(-1)

    elif command[0] == "back":
        if queue.back():
            print(queue.back())
        else:
            print(-1)
