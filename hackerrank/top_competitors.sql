SELECT s.hacker_id, h.name
FROM Submissions s
JOIN Challenges c ON c.challenge_id = s.challenge_id
JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
JOIN Hackers h ON s.hacker_id = h.hacker_id
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC
