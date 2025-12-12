WITH reviews AS (
SELECT *,
       LAG(rating) OVER(PARTITION BY p.employee_id ORDER BY p.review_date DESC) AS next_rating,
       LAG(rating,2) OVER(PARTITION BY p.employee_id ORDER BY p.review_date DESC) AS next_next_rating,
       COUNT(p.review_id) OVER(PARTITION BY p.employee_id) AS review_cnt,
        FIRST_VALUE(p.rating) OVER(PARTITION BY p.employee_id ORDER BY p.review_date DESC) AS last_rating
FROM performance_reviews p
)
SELECT r.employee_id,
        e.name,
        next_next_rating - rating AS improvement_score
FROM reviews r
JOIN employees e ON r.employee_id = e.employee_id
WHERE last_rating = next_next_rating
AND r.rating < next_rating AND next_rating < next_next_rating
AND review_cnt >= 3
ORDER BY 3 DESC, 2
