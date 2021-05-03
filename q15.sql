SELECT short_name, total_podiums_one, total_podiums as total_podiums_two from 
( SELECT short_name, total_podiums as total_podiums_one, driver_two   FROM (SELECT * FROM Teams WHERE 
(SELECT Drivers.total_podiums FROM Drivers WHERE driver_id=Teams.driver_one) > 5*(SELECT Drivers.total_podiums FROM Drivers WHERE driver_id=Teams.driver_two)
ORDER By short_name) JOIN Drivers ON driver_id=driver_one )  JOIN Drivers ON driver_id=driver_two

-- Firstly, we get teams table, then we check conditions. 
--After getting teams table, by using driver_one and driver_two fields, we get their total podiums.
-- Then, by checking driver one's total_podiums > driver two's total_podiums, we filter teams according to this condition.
-- Then we make drivers join to these filtered Team table we get their total_podiums. We make this process one by one in 
