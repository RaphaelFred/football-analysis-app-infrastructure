SELECT 
	fix.fixture_id,
	fix.fixture_timestamp_utc,
	ls.country,
	ls.league_name,
	fix.home_team_name,
	fix.away_team_name,
	fix.goals_home,
	fix.goals_away,
	fix.goals_home + fix.goals_away AS total,
	hs.goals_last_3_home_matches,
	hs.more_than_6_goals_last_3_home_matches,
	hs.num_matches_greater_2_goals_last_3_home_matches,
	hs.number_matches_atleast_one_team_not_scored_last_3_home_matches,
    away.goals_last_3_away_matches,
	away.more_than_6_goals_last_3_away_matches,
	away.num_matches_greater_2_goals_last_3_away_matches,
	away.num_goals_last_match,
	away.num_matches_greater_0_away_goals_last_3_away_matches,
	btts_home.home_team_points,
	btts_away.away_team_points
FROM public.module1_fixture fix
INNER JOIN public.module1_homestatistics hs
	ON fix.fixture_id = hs.fixture_id AND fix.home_team_name = hs.home_team_name
INNER JOIN public.module1_awaystatistics away
	ON fix.fixture_id = away.fixture_id AND fix.away_team_name = away.away_team_name 
LEFT JOIN public.module1_leagueseason ls
	ON fix.league_season_id = ls.league_season_id 
LEFT JOIN public.module1_bttsstatistics btts_home 
	ON fix.fixture_id = btts_home.fixture_id AND fix.home_team_name = btts_home.team_name
LEFT JOIN public.module1_bttsstatistics btts_away 
	ON fix.fixture_id = btts_away.fixture_id AND fix.away_team_name = btts_away.team_name 
;