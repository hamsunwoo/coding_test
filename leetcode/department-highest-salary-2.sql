SELECT d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary
FROM Employee e
JOIN (
SELECT departmentId, MAX(salary) AS max_salary
FROM Employee
GROUP BY departmentId
) ee ON e.departmentId = ee.departmentId
AND e.salary = ee.max_salary
JOIN Department d ON d.id = e.departmentId
