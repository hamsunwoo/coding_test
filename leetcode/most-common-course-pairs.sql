SELECT DISTINCT tmp.course_name AS first_course,
                tmp.second_course AS second_course,
        COUNT(*) OVER(PARTITION BY tmp.course_name,tmp.second_course) AS transition_count
FROM (
SELECT course_name,
        LEAD(course_name) OVER(PARTITION BY user_id ORDER BY completion_date) AS second_course
FROM course_completions
WHERE user_id IN (
SELECT user_id
FROM course_completions
GROUP BY user_id
HAVING COUNT(user_id) >= 5 
AND AVG(course_rating) >= 4
)
) tmp
WHERE tmp.second_course IS NOT NULL
ORDER BY 3 DESC, 1 ASC, 2 ASC
