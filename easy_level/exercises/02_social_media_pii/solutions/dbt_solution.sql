-- models/social_media_pii_output.sql

WITH transformed_data AS (
  SELECT 
    CAST(user_id AS INT) AS user_id,
    SPLIT_PART(email, '@', 2) AS email_domain,
    CONCAT('******', RIGHT(CAST(phone AS TEXT), 4)) AS anon_phone
  FROM {{ ref('social_media_pii_input') }}
)

SELECT 
  anon_phone,
  email_domain,
  user_id
FROM transformed_data
ORDER BY anon_phone
