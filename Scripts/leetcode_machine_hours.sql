WITH machine_starts_time AS (
	SELECT 
		ROW_NUMBER() OVER (ORDER BY machine_id) AS sur_key,
		machine_id,
        process_id,
        activity_type,
        timestamp AS start_time
	FROM activity
    WHERE activity_type = 'start'
),
machine_end_time AS (
	SELECT
		ROW_NUMBER() OVER (ORDER BY machine_id) AS sur_key,
		machine_id,
        process_id,
        activity_type,
        timestamp AS end_time
	FROM activity
    WHERE activity_type = 'end'
)
SELECT 
	machine_id,
	ROUND(AVG(TotalMinPerMachine), 3) AS processing_time 
FROM(
SELECT 
	en.machine_id,
	en.end_time - st.start_time AS TotalMinPerMachine
FROM machine_end_time  AS en
JOIN machine_starts_time AS st
	ON en.sur_key = st.sur_key
) AS t
GROUP BY machine_id