SELECT D.first_name, D.last_name, T.base_location, D.total_podiums, D.driver_hrf
FROM Drivers D, Teams T
WHERE D.team=T.team_id AND T.base_location like '%LAND'
ORDER BY T.base_location DESC, D.total_podiums ASC, D.driver_hrf ASC

-- With the help of regular expressions we can get the teams whose base location is in a country that ends with LAND.
-- like '%LAND' means string that ends with LAND.
-- Also order of base_location, total_podiums and driver_hrf is important in the line of ORDER BY.