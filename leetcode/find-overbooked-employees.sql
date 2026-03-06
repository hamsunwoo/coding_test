SELECT tmp.employee_id,
        tmp.employee_name,
        tmp.department,
        COUNT(tmp.weeks) AS meeting_heavy_weeks
FROM (
SELECT m.employee_id,
        e.employee_name,
        e.department,
        YEARWEEK(m.meeting_date, 1) AS weeks,
        SUM(m.duration_hours)
FROM meetings m
JOIN employees e ON m.employee_id = e.employee_id
GROUP BY m.employee_id,
        e.employee_name,
        e.department,
        YEARWEEK(m.meeting_date,1)
HAVING SUM(m.duration_hours) > 20
) tmp
GROUP BY 1, 2, 3
HAVING COUNT(tmp.weeks) > 1
ORDER BY meeting_heavy_weeks DESC, tmp.employee_name ASC
