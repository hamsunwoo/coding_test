from collections import deque

def solution(begin, target, words):
    if target not in words:
        return 0

    queue = deque([begin, 0)]
    visited = set()

    while queue:
        current_word, step = queue.popleft()

        if current_word == target:
            return step

        for word in words:
            if word not in visited and can_transform(current_word, word):
                visited.add(word)
                queue.append((word, step +1))

    return 0

def can_transform(word1, word2):
    a = sum([1 for a, b in zip(word1, word2) if a != b])
    return a == 1
