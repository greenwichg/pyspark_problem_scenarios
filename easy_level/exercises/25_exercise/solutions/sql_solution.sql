SELECT
    cdate,
    SUM(CASE WHEN user_type = 'free' THEN downloads ELSE 0 END) AS non_paying_downloads,
    SUM(CASE WHEN user_type = 'premium' THEN downloads ELSE 0 END) AS paying_downloads
FROM adtc_customer
GROUP BY cdate
HAVING SUM(CASE WHEN user_type = 'free' THEN downloads ELSE 0 END) > 
       SUM(CASE WHEN user_type = 'premium' THEN downloads ELSE 0 END)
ORDER BY cdate ASC;
