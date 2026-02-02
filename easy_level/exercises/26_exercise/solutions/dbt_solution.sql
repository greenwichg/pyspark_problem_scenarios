WITH base AS (
  SELECT
    drug,
    total_sales,
    cogs,
    CAST(total_sales - cogs AS NUMERIC(10, 2)) AS total_profit
  FROM {{ ref('tpd_top_drug') }}
)

SELECT
  drug,
  total_profit
FROM base
ORDER BY total_profit DESC
LIMIT 3
