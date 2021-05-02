SELECT short_name, team_hrf_count, total_driver_hrf_count from (SELECT *,sum(driver_hrf_count) as total_driver_hrf_count FROM Teams LEFT JOIN  Drivers ON team_id=Drivers.team GROUP by team) WHERE team_hrf_count< total_driver_hrf_count ORDER By short_name DESC
