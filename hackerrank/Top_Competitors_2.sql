-- 최종출력 hacker_id, name
-- 1. 한개의 challenge 이상 full score
-- 1-1. full score를 가진 challenge만 가져오기 (o)
-- 1-2. hacker별 challenge 개수 카운트하기 
-- 2. 전체 challenge 개수를 내림차순 
-- 3. 같은 challenge 개수에서 full score 받은 사람이 2명이라면 hacker_id 기준 오름차순

SELECT h.hacker_id, h.name
FROM Submissions s
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
JOIN Hackers h ON h.hacker_id = s.hacker_id
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1 
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC;
