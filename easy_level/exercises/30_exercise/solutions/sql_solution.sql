WITH min_max_issued AS (
    SELECT 
        card_name,
        MAX(issued_amount) AS max_issued,
        MIN(issued_amount) AS min_issued
    FROM 
        ca_monthly_cards_issued
    GROUP BY 
        card_name
),
disparity AS (
    SELECT 
        card_name,
        (max_issued - min_issued) AS difference
    FROM 
        min_max_issued
)
SELECT 
    card_name, 
    difference
FROM 
    disparity
ORDER BY 
    difference DESC;
