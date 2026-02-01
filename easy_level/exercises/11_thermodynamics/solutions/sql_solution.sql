SELECT
    t.ExperimentID,
    (t.Temperature * p.Pressure) AS Result
FROM
    df_temperature t
INNER JOIN
    df_pressure p
ON
    t.ExperimentID = p.ExperimentID
ORDER BY
    t.ExperimentID;