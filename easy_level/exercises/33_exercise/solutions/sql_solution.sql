SELECT 
    drug,
    ROUND((total_sales - cogs)::NUMERIC, 2) AS total_profit
FROM 
    dp_pharmacy_sales
ORDER BY 
    total_profit DESC
LIMIT 3;
