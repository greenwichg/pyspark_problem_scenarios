SELECT
    user_id,
    DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM
    post_gap_posts
WHERE
    post_date >= '2021-01-01'
    AND post_date < '2022-01-01'
GROUP BY
    user_id
HAVING
    COUNT(*) >= 2;
