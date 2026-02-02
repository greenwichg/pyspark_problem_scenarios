SELECT
  drug,
  ROUND((total_sales - cogs)::numeric, 2) AS total_profit
FROM tpd_top_drug
ORDER BY total_profit DESC
LIMIT 3;
