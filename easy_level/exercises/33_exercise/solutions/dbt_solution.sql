WITH profit_calc AS (
    SELECT 
        drug,
        (total_sales - cogs) AS total_profit
    FROM {{ ref('dp_pharmacy_sales') }}
)

SELECT 
    drug,
    ROUND(total_profit, 2) AS total_profit
FROM profit_calc
ORDER BY total_profit DESC
LIMIT 3
