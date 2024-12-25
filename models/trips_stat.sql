select 
  count(*) as trips, 
  count(DISTINCT user_id) as users, 
  avg(
    EXTRACT(
      EPOCH 
      FROM 
        (finished_at - started_at)/ 60
    )
  ) as avg_duration_m, 
  sum(price) / 100 as revenue_rub, 
  (
    count(*) FILTER (
      WHERE 
        price = 0
    ):: decimal / count(*):: decimal
  )* 100 as free_trips_pct 
from 
  scooters_raw.trips
