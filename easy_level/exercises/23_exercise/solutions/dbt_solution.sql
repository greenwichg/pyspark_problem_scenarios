-- models/top_completed_trade_cities.sql

WITH completed_trades AS (
    SELECT 
        u.city, 
        COUNT(*) AS total_orders
    FROM {{ ref('tr_trades') }} t
    JOIN {{ ref('tr_users') }} u 
      ON t.user_id = u.user_id
    WHERE t.status = 'Completed'
    GROUP BY u.city
)

SELECT 
    city, 
    total_orders
FROM completed_trades
ORDER BY total_orders DESC
LIMIT 3
