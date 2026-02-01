SELECT page_id
FROM {{ ref('nlp_pages') }}
EXCEPT
SELECT page_id
FROM {{ ref('nlp_page_likes') }};
