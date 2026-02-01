-- Write query here
WITH transformed_data AS (
  SELECT 
    cast(user_id as int) user_id,
    SPLIT_PART(email, '@', 2) AS email_domain,
    CONCAT('******', RIGHT(phone::text, 4)) AS anon_phone
  FROM social_media_pii_input
)
SELECT 
  anon_phone,
  email_domain,
  user_id
FROM transformed_data
ORDER BY anon_phone;