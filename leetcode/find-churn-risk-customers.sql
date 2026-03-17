# Write your MySQL query statement below

with active_users as (
select
user_id,
event_date,
plan_name as current_plan,
monthly_amount as current_monthly_amount
from ( select 
    user_id,
    rank() over (partition by user_id order by event_date desc) as date_ranking,
    event_date,
    plan_name,
    monthly_amount
from subscription_events
) s
where 
    plan_name is not null
    and date_ranking = 1
),

downgrade_users as (
    select user_id
    from subscription_events
    where event_type = 'downgrade'
    group by user_id
),

max_revenue as (
    select
        user_id,
        max(monthly_amount) as max_historical_amount
    from subscription_events
    group by user_id
),

subscription_start as (
select    
user_id,
start_date as latest_start_date
    from ( select 
    user_id,
    event_date as start_date,
    rank() over (partition by user_id order by event_date desc) as start_ranking
    from subscription_events
    where event_type = 'start'
    ) s
where start_ranking = 1
)

select  
au.user_id,
au.current_plan,
au.current_monthly_amount,
m.max_historical_amount,
datediff(au.event_date, ss.latest_start_date) as days_as_subscriber
from active_users au
join downgrade_users du 
on au.user_id = du.user_id
join max_revenue m
on m.user_id = au.user_id
join subscription_start ss 
on au.user_id = ss.user_id
where datediff(au.event_date, ss.latest_start_date) >= 60
and 1.0*au.current_monthly_amount / m.max_historical_amount < 0.50
order by 5 desc, au.user_id asc
