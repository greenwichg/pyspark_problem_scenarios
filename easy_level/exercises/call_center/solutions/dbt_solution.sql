-- models/daily_customer_summary.sql

WITH joined AS (
    SELECT 
        c.cust_id, 
        c.date, 
        c.duration
    FROM {{ ref('cc_calls') }} c
    JOIN {{ ref('cc_customer') }} cu
        ON c.cust_id = cu.cust_id
),

agg AS (
    SELECT
        date,
        COUNT(DISTINCT cust_id) AS num_customers,
        SUM(CAST(duration AS INT)) AS total_duration
    FROM joined
    GROUP BY date
)

SELECT 
    date, 
    CAST(num_customers AS INT) AS num_customers, 
    CAST(total_duration AS INT) AS total_duration
FROM agg
ORDER BY date
