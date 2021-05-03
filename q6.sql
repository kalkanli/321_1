SELECT * FROM (SELECT  short_name, full_name, team_wc_count, SUM(total_podiums) as team_total_podiums 
FROM (SELECT * FROM (SELECT * FROM Teams WHERE team_id  IN( 
SELECT team FROM Drivers WHERE country_of_birth<>country_of_driver_license)) 
LEFT JOIN Drivers ON Drivers.team=team_id) GROUP BY team_id)  WHERE team_total_podiums>9 ORDER BY short_name DESC


--Firstly we make Drivers join to Teams by checking their team_id is equal to teams
-- and their country_driver_license is not equal to country_of_birth. Then we sum drivers' total_podiums 
-- up and group them according to teams so we get sum(total_podiums) as team_total_podiums.
-- Finally by checking team_total_podiums is greater than 9 and ordering them by short_name we get result.