SELECT team.team_id, team.short_name, team.full_name, ROUND(SUM(CAST(track.clim AS float)*track.total_laps/1000), 3) AS total_driven
FROM Teams team, Drivers driver, Tracks track
WHERE
    ((track.lap_recorder=team.driver_one AND driver.driver_id=team.driver_one AND driver.country_of_birth<>"England")
    OR (track.lap_recorder=team.driver_two AND driver.driver_id=team.driver_two AND driver.country_of_birth<>"England"))
GROUP BY team.team_id
HAVING total_driven>500
ORDER BY total_driven ASC