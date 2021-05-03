SELECT year_of_birth,SUM(total_points) as sum_of_tpoints
FROM Drivers
WHERE year_of_birth BETWEEN 1990 AND 1999
GROUP BY year_of_birth
ORDER BY sum_of_tpoints DESC

-- By grouping the drivers by their year_of_birth we can 
-- sum the points of that all drivers who are born in that year.