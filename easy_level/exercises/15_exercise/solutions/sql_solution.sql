SELECT 
  tweet_count_per_user AS tweet_bucket, 
  COUNT(user_id) AS users_count
FROM (
  SELECT 
    user_id, 
    COUNT(tweet_id) AS tweet_count_per_user 
  FROM taa_twitter_activity
  WHERE tweet_date BETWEEN '2022-01-01' 
    AND '2022-12-31'
  GROUP BY user_id
) AS total_tweets 
GROUP BY tweet_count_per_user;
