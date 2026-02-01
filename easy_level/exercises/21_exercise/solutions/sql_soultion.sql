WITH message_counts AS (
    SELECT 
        sender_id,
        COUNT(*) AS message_count
    FROM 
        ttu_messages
    WHERE 
        DATE_PART('year', sent_date) = 2022
        AND DATE_PART('month', sent_date) = 8
    GROUP BY 
        sender_id
)
SELECT 
    sender_id, 
    message_count
FROM 
    message_counts
ORDER BY 
    message_count DESC
LIMIT 2;
