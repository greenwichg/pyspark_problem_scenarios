SELECT
    manufacturer,
    COUNT(*) AS drug_count,
    CAST(SUM(cogs - total_sales) AS numeric(12, 2)) AS total_loss
FROM dls_drug_loss
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC;
