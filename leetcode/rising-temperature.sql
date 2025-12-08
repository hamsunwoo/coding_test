SELECT t1.id
FROM (
SELECT *,
       LAG(temperature) OVER(ORDER BY recordDate ASC) AS "previous_temp",
       LAG(recordDate) OVER(ORDER BY recordDate ASC) AS "previous_date"
FROM Weather
) t1
WHERE t1.temperature > t1.previous_temp
AND DATEDIFF(t1.recorddate, t1.previous_date) = 1
