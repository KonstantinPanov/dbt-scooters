WITH cte1 AS (
  select 
    t.started_at :: date as date, 
    extract(
      year 
      from 
        t.started_at :: date
    ) - extract(
      year 
      from 
        u.birth_date
    ) as age, 
    count(*) as trips 
  from 
    scooters_raw.trips as t 
    inner join scooters_raw.users as u on u.id = t.user_id 
  group by 
    1, 
    2
) 
SELECT 
  age, 
  avg(trips) as avg_trips 
FROM 
  cte1 
group by 
  1 
order by 
  1