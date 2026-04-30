SELECT MAX(E1.salary) as SecondHighestSalary
FROM Employee E1
WHERE E1.salary < (
    SELECT MAX(E2.salary)
    FROM Employee E2
)
