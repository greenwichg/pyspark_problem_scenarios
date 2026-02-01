SELECT 
    m.location,
    e.mineral,
    SUM(e.quantity) AS total_quantity
FROM 
    mc_mines m
JOIN 
    mc_extraction e ON m.id = e.mine_id
GROUP BY 
    m.location, e.mineral
ORDER BY 
    m.location ASC, e.mineral ASC;