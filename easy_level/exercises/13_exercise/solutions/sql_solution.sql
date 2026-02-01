SELECT 
    sender_id, 
    COUNT(message_id) AS message_count
FROM 
    dqt_messages
WHERE 
    DATE_FORMAT(sent_date, '%Y-%m') = '2022-08'
GROUP BY 
    sender_id
ORDER BY 
    message_count DESC
LIMIT 2;
