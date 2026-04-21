# Write your MySQL query statement below
# Write your MySQL query statement below
with recursive Hierarchy as (
    select employee_id, employee_name, manager_id, salary, 1 as level 
    from employees 
    where manager_id is null
    union all
    select e.employee_id, e.employee_name, e.manager_id, e.salary, h.level + 1
    from employees as e 
    join 
    Hierarchy as h 
    on e.manager_id = h.employee_id
),
Subordinates as (
    select manager_id, employee_id as subordinate_id 
    from employees 
    where manager_id is not null
    union all 
    select s.manager_id, e.employee_id 
    from subordinates as s
    join 
    employees as e 
    on e.manager_id = s.subordinate_id
),
ManagerStats as (
    select s.manager_id, count(*) as team_size, sum(e.salary) as team_salary
    from subordinates as s 
    join 
    employees as e 
    on s.subordinate_id = e.employee_id
    group by s.manager_id
),
FinalResult as (
    select h.employee_id, h.employee_name, h.level, coalesce(ms.team_size, 0) as team_size, h.salary + coalesce(ms.team_salary, 0) as budget 
    from Hierarchy as h 
    left join
    ManagerStats as ms 
    on h.employee_id = ms.manager_id
)

select * 
from finalResult 
order by level asc, budget desc, employee_name asc
