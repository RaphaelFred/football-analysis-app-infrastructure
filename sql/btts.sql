-- Results Ratio Per Year and Month
WITH BTTS AS (
    SELECT 
        btts.fixture_id,
        btts.fixture_timestamp_utc,
        btts.country,
        btts.league_name,
        btts.home_team_name,
        btts.away_team_name,
        btts.home_team_points,
        btts.away_team_points,
        fix.goals_home,
        fix.goals_away,
        CASE WHEN fix.goals_home > 0 AND fix.goals_away > 0 THEN 1 ELSE 0 END AS SUCCESS

    FROM public.module1_btts btts
    LEFT JOIN module1_fixture fix on btts.fixture_id = fix.fixture_id
    -- WHERE ODD IS NOT NULL 
     ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM btts.fixture_timestamp_utc) AS YEAR,
    EXTRACT('month' FROM btts.fixture_timestamp_utc) AS MONTH,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(btts.FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(btts.FIXTURE_ID) AS SUCCESS_RATIO
FROM BTTS
GROUP BY
    1, 2
ORDER BY 
    1, 2
;

-- Results Ratio Per Year and Country
WITH BTTS AS (
    SELECT 
        btts.fixture_id,
        btts.fixture_timestamp_utc,
        btts.country,
        btts.league_name,
        btts.home_team_name,
        btts.away_team_name,
        btts.home_team_points,
        btts.away_team_points,
        fix.goals_home,
        fix.goals_away,
        CASE WHEN fix.goals_home > 0 AND fix.goals_away > 0 THEN 1 ELSE 0 END AS SUCCESS

    FROM public.module1_btts btts
    LEFT JOIN module1_fixture fix on btts.fixture_id = fix.fixture_id
    -- WHERE ODD IS NOT NULL 
     ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM btts.fixture_timestamp_utc) AS YEAR,
    COUNTRY,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(btts.FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(btts.FIXTURE_ID) AS SUCCESS_RATIO
FROM BTTS
GROUP BY
    1, 2
ORDER BY 
     2, 1
;


WITH BTTS AS (
    SELECT 
        btts.fixture_id,
        btts.fixture_timestamp_utc,
        btts.country,
        btts.league_name,
        btts.home_team_name,
        btts.away_team_name,
        btts.home_team_points,
        btts.away_team_points,
        fix.goals_home,
        fix.goals_away,
        CASE WHEN fix.goals_home > 0 AND fix.goals_away > 0 THEN 1 ELSE 0 END AS SUCCESS

    FROM public.module1_btts btts
    LEFT JOIN module1_fixture fix on btts.fixture_id = fix.fixture_id
    -- WHERE ODD IS NOT NULL 
     ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM btts.fixture_timestamp_utc) AS YEAR,
    COUNTRY,
    LEAGUE_NAME,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(btts.FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(btts.FIXTURE_ID) AS SUCCESS_RATIO
FROM BTTS
GROUP BY
    1, 2, 3
ORDER BY 
     2, 3, 1
;