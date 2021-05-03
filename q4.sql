SELECT SUM(D.total_points)
FROM Drivers D, Teams T, PUMs P
WHERE 
    (T.pum=P.pum_id AND NOT(P.pum_name='Mercedes'))
    AND D.team=T.team_id AND T.base_location='England'
    AND D.country_of_driver_license=D.country_of_birth

-- First line after WHERE filters the teams that does not buy from Mercedes.
-- Second line filters the drivers who drive for teams whose base location is in England.
-- Third line filters the drivers who got their licence in the country they were born at.
