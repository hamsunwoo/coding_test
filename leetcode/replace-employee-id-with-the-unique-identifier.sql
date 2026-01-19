SELECT m.unique_id,
        e.name
FROM Employees e
LEFT JOIN EmployeeUNI m ON m.id = e.id
