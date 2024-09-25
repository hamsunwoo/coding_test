#queue 구현

queue_list = list()

def enqueue(value):
    queue_list.append(value)

def dequeue():
    value = queue_list[0]
    del queue_list[0]

    return value

def peek():
    value = queue_list[0]

    return value

for i in range(10):
    enqueue(i)

print(queue_list)
dequeue()
print(queue_list)
print(peek())

