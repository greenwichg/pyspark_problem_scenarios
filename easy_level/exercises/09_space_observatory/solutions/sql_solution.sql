SELECT
    s.name AS star_name,
    s.color AS star_color,
    s.type AS star_type,
    p.name AS planet_name,
    p.type AS planet_type,
    s.distance AS distance_star_earth,
    p.distance AS distance_planet_star
FROM
    so_planet p
JOIN
    so_star s
ON
    p.star_id = s.id;
