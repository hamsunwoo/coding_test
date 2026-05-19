SELECT id AS Id
FROM (
SELECT *, LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
FROM Weather
) tmp
WHERE DATEDIFF(tmp.recordDate, tmp.prev_date) = 1
AND tmp.temperature > tmp.prev_temp
