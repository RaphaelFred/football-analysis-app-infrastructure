-- Results Ratio Per Year and Month
WITH OVER25 AS (
    SELECT 
        fixture_id,
        fixture_timestamp_utc,
        country,
        league_name,
        home_team_name,
        away_team_name,
        goals_home,
        goals_away,
        CASE WHEN (goals_home + goals_away) > 2  THEN 1 ELSE 0 END AS SUCCESS
    FROM public.module1_over25
    ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM fixture_timestamp_utc) AS YEAR,
    EXTRACT('month' FROM fixture_timestamp_utc) AS MONTH,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(FIXTURE_ID) AS SUCCESS_RATIO
FROM OVER25
GROUP BY
    1, 2
ORDER BY 
    1, 2
;

-- Results Ratio Per Year and Country
WITH OVER25 AS (
    SELECT 
        fixture_id,
        fixture_timestamp_utc,
        country,
        league_name,
        home_team_name,
        away_team_name,
        goals_home,
        goals_away,
        CASE WHEN (goals_home + goals_away) > 2  THEN 1 ELSE 0 END AS SUCCESS
    FROM public.module1_over25
    ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM fixture_timestamp_utc) AS YEAR,
    COUNTRY,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(FIXTURE_ID) AS SUCCESS_RATIO
FROM OVER25
GROUP BY
    1, 2
ORDER BY 
    2, 1
;

-- Results Ratio Per Year, Country and League
WITH OVER25 AS (
    SELECT 
        fixture_id,
        fixture_timestamp_utc,
        country,
        league_name,
        home_team_name,
        away_team_name,
        goals_home,
        goals_away,
        CASE WHEN (goals_home + goals_away) > 2  THEN 1 ELSE 0 END AS SUCCESS
    FROM public.module1_over25
    ORDER BY FIXTURE_TIMESTAMP_UTC
)
SELECT
    EXTRACT('year' FROM fixture_timestamp_utc) AS YEAR,
    COUNTRY,
    LEAGUE_NAME,
    CAST(SUM(SUCCESS) as float) AS NUM_SUCCESSES,
    CAST(COUNT(FIXTURE_ID) as float) AS NUM_FIXTURES,
    CAST(SUM(SUCCESS) AS FLOAT)/COUNT(FIXTURE_ID) AS SUCCESS_RATIO
FROM OVER25
GROUP BY
    1, 2, 3
ORDER BY 
    2, 3, 1
;