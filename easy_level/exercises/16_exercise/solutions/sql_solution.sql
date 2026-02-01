SELECT page_id
FROM nlp_pages
EXCEPT
SELECT page_id
FROM nlp_page_likes;