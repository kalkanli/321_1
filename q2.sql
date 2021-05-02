SELECT year_of_birth,SUM( total_points)  as sum_of_tpoints  FROM Drivers WHERE   year_of_birth BETWEEN 1990 AND 1999  GROUP BY year_of_birth ORDER BY  sum_of_tpoints DESC
