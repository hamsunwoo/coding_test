SELECT tmp.driver_id,
        tmp.driver_name,
        ROUND(tmp.first_half_avg,2) AS first_half_avg,
        ROUND(tmp.second_half_avg,2) AS second_half_avg,
       ROUND(tmp.second_half_avg - tmp.first_half_avg,2) AS efficiency_improvement
FROM (
SELECT t.driver_id,
        d.driver_name,
        AVG(CASE WHEN MONTH(t.trip_date) BETWEEN 1 AND 6 THEN distance_km / fuel_consumed END) AS first_half_avg,
        AVG(CASE WHEN MONTH(t.trip_date) BETWEEN 7 AND 12 THEN distance_km / fuel_consumed END) AS second_half_avg
FROM trips t
JOIN drivers d ON t.driver_id = d.driver_id
GROUP BY 1, 2
) tmp
WHERE tmp.second_half_avg > tmp.first_half_avg
ORDER BY efficiency_improvement DESC, tmp.driver_name ASC
