-- CTE: compute salary per hit and salary per RBI
WITH stats AS (
    SELECT
        salaries.player_id,
        salaries.salary * 1.0 / NULLIF(performances.H, 0) AS salary_per_hit,
        salaries.salary * 1.0 / NULLIF(performances.RBI, 0) AS salary_per_rbi
    FROM salaries
    JOIN performances ON performances.player_id = salaries.player_id
    WHERE salaries.year = 2001 AND performances.year = 2001
),

-- CTE: top 10 least expensive per hit
top_hit AS (
    SELECT player_id
    FROM stats
    ORDER BY salary_per_hit
    LIMIT 10
),

-- CTE: top 10 least expensive per RBI
top_rbi AS (
    SELECT player_id
    FROM stats
    ORDER BY salary_per_rbi
    LIMIT 10
)

-- Final result: players in both top 10 lists
SELECT players.first_name, players.last_name
FROM players
WHERE players.id IN (
    SELECT player_id FROM top_hit
    INTERSECT
    SELECT player_id FROM top_rbi
)
ORDER BY players.id;
