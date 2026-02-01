WITH user_tweet_counts AS (
    -- Step 1: Count tweets per user for the given date range
    SELECT 
        user_id, 
        COUNT(tweet_id) AS tweet_count_per_user
    FROM {{ ref('taa_twitter_activity') }}
    WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY user_id
),

bucketed_users AS (
    -- Step 2: Count users in each tweet bucket
    SELECT 
        tweet_count_per_user AS tweet_bucket, 
        COUNT(user_id) AS users_count
    FROM user_tweet_counts
    GROUP BY tweet_count_per_user
)

SELECT * FROM bucketed_users;
