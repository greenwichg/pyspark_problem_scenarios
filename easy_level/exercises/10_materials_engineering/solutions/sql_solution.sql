SELECT
    e.experiment_id,
    e.material_id,
    TO_CHAR(e.experiment_date, 'YYYY-MM-DD') AS experiment_date,
    e.experiment_results,
    m.material_name,
    m.material_type
FROM
    me_experiments e
FULL OUTER JOIN
    me_materials m
ON
    e.material_id = m.material_id
WHERE
    e.experiment_id IS NOT NULL -- Exclude rows with NULL experiment_id
ORDER BY
    e.experiment_id ASC;
