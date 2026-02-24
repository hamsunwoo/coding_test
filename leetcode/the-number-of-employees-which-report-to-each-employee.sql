SELECT employee_id,
        name,
        a.reports_count,
        a.average_age
FROM Employees e
JOIN (      
SELECT reports_to,
        COUNT(reports_to) AS reports_count,
        ROUND(AVG(age), 0) AS average_age
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to
) a ON a.reports_to = e.employee_id
ORDER BY 1
