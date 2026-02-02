-- models/mean_item_count.sql

SELECT 
  ROUND(
    SUM(CAST(item_count AS DECIMAL) * order_occurrences) 
    / SUM(order_occurrences), 
    1
  ) AS mean
FROM {{ ref('aipo_average_item') }}
