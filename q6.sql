SELECT * FROM (SELECT  short_name, full_name, team_wc_count, SUM(total_podiums) as team_total_podiums FROM (SELECT * FROM (SELECT * FROM Teams WHERE team_id  IN( 
SELECT team FROM Drivers WHERE country_of_birth<>country_of_driver_license)) LEFT JOIN Drivers ON Drivers.team=team_id) GROUP BY team_id)  WHERE team_total_podiums>9 ORDER BY short_name DESC
