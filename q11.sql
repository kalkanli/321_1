SELECT DISTINCT team.short_name, team.base_location, driver.first_name, driver.country_of_birth, track.circuit_country
FROM Teams team, Drivers driver, Tracks track
WHERE 
    (team.driver_one=driver.driver_id OR team.driver_two=driver.driver_id) 
    AND track.lap_recorder=driver.driver_id
    AND (track.circuit_country="Monaco" OR track.circuit_country="France")
    AND NOT EXISTS (SELECT * from Tracks t WHERE t.lap_recorder=driver.driver_id AND t.circuit_country<>"France" AND t.circuit_country<>"Monaco")
ORDER BY team.short_name ASC

-- We are looking for teams that has a lap recorder only in countries France or Monaco.
-- Therefor we first pick the teams with drivers who are lap recorder in France or Monaco and check 
-- if they are also lap recorder in tracks that are not in france and not in Monaco with the help of NOT EXIST().