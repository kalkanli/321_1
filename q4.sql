SELECT SUM(D.total_points) from Drivers D, Teams T, PUMs P WHERE 
(T.pum=P.pum_id AND NOT(P.pum_name='Mercedes')) AND D.team=T.team_id AND T.base_location='England'  AND D.country_of_driver_license=D.country_of_birth;
