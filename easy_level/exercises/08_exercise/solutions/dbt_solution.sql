-- models/mineral_summary.sql

SELECT 
    m.location,
    e.mineral,
    SUM(e.quantity) AS total_quantity
FROM 
    {{ ref('mc_mines') }} m
JOIN 
    {{ ref('mc_extraction') }} e 
    ON m.id = e.mine_id
GROUP BY 
    m.location, e.mineral
ORDER BY 
    m.location ASC, e.mineral ASC
