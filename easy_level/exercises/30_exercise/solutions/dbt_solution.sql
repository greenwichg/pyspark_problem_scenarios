-- models/cards_issued_disparity.sql

WITH min_max_issued AS (
    SELECT 
        card_name,
        MAX(issued_amount) AS max_issued,
        MIN(issued_amount) AS min_issued
    FROM {{ ref('ca_monthly_cards_issued') }}
    GROUP BY card_name
)

SELECT 
    card_name,
    (max_issued - min_issued) AS difference
FROM min_max_issued
ORDER BY difference DESC
