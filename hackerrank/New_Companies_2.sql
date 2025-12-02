SELECT e.company_code,
        c.founder,
        COUNT(DISTINCT e.lead_manager_code),
        COUNT(DISTINCT e.senior_manager_code),
        COUNT(DISTINCT manager_code),
        COUNT(DISTINCT e.employee_code)
FROM Employee e
JOIN Company c ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY 1;
