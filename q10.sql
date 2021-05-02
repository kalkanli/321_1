SELECT d.driver_id, d.first_name, d.last_name, t.circuit_name, t.lrims
FROM Drivers d, Tracks t, Teams te
WHERE (t.lap_recorder=d.driver_id) AND (d.team=te.team_id) AND (te.short_name="Red Bull Racing")
ORDER BY t.lrims ASC