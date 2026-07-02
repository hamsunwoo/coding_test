SELECT *
FROM Cinema
WHERE description != 'boring'
HAVING id % 2 >= 1
ORDER BY rating DESC
