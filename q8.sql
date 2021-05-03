SELECT team.team_id, team.short_name, team.full_name, ROUND(SUM(CAST(track.clim AS float)*track.total_laps/1000), 3) AS total_driven
FROM Teams team, Drivers driver, Tracks track
WHERE
    ((track.lap_recorder=team.driver_one AND driver.driver_id=team.driver_one AND driver.country_of_birth<>"England")
    OR (track.lap_recorder=team.driver_two AND driver.driver_id=team.driver_two AND driver.country_of_birth<>"England"))
GROUP BY team.team_id
HAVING total_driven>500
ORDER BY total_driven ASC

-- This query selects the teams with at least one driver being a lap recorder. 
-- Teams that have 2 drivers being a lap recorder are listed two times for each driver. 
-- After that we group our table by team_id and sum the total driven of each team.