SELECT * FROM public.module1_btts WHERE odd is not null;
SELECT * FROM public.module1_over25 WHERE odd is not null;
SELECT * FROM public.module1_under25 WHERE odd is not null;


SELECT LEAGUE_NAME, COUNTRY, SUM(profit_loss_all) as profit, COUNT(DISTINCT FIXTURE_ID) AS GAME_COUNT from public.module1_btts WHERE odd is not null GROUP BY LEAGUE_NAME, COUNTRY ORDER BY profit desc;
SELECT LEAGUE_NAME, COUNTRY, SUM(profit_loss_all) as profit, COUNT(DISTINCT FIXTURE_ID) AS GAME_COUNT from public.module1_under25 WHERE odd is not null GROUP BY LEAGUE_NAME, COUNTRY ORDER BY profit desc;
SELECT LEAGUE_NAME, COUNTRY, SUM(profit_loss_all) as profit, COUNT(DISTINCT FIXTURE_ID) AS GAME_COUNT from public.module1_over25 WHERE odd is not null GROUP BY LEAGUE_NAME, COUNTRY ORDER BY profit desc;
SELECT SUM(profit_loss_all) from public.module1_btts WHERE odd is not null;
SELECT SUM(profit_loss_all) from public.module1_under25 WHERE odd is not null;


SELECT COUNTRY, SUM(profit_loss_all) AS PROFIT, COUNT(*) from public.module1_btts WHERE odd is not null GROUP BY 1 ORDER BY profit desc;


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
    fix.goals_away
    
FROM public.module1_btts btts
LEFT JOIN module1_fixture fix on btts.fixture_id = fix.fixture_id
-- WHERE ODD IS NOT NULL 
 ORDER BY FIXTURE_TIMESTAMP_UTC;