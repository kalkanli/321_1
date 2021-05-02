SELECT(
    ABS((SELECT SUM(d1.total_points) FROM Drivers d1 WHERE (d1.year_of_birth BETWEEN 1980 AND 1989)) -
    (SELECT SUM(d2.total_points) from Drivers d2 WHERE (d2.year_of_birth BETWEEN 1990 and 1999)))
) as absolute_difference