
SELECT  circuit_type, short_name, team_lap_recorder FROM (SELECT    Tracks.circuit_type, Teams.short_name, count(lap_recorder)  as team_lap_recorder FROM Teams,Tracks WHERE ( Teams.driver_one= Tracks.lap_recorder OR  Teams.driver_two=Tracks.lap_recorder )  GROUP by Teams.short_name ,   Tracks.circuit_type   ) 
INNER JOIN
(SELECT  circuit_type as circuit_type_cascade,max(team_lap_recorder) as max_value FROM (SELECT    Tracks.circuit_type, Teams.short_name, count(lap_recorder)  as team_lap_recorder FROM Teams,Tracks WHERE ( Teams.driver_one= Tracks.lap_recorder OR  Teams.driver_two=Tracks.lap_recorder )  GROUP by Teams.short_name ,   Tracks.circuit_type   ) 
 GROUP by circuit_type)
 ON (max_value= team_lap_recorder and circuit_type=circuit_type_cascade)
 ORDER BY circuit_type,team_lap_recorder  DESC

 -- Firstly, we get tracks and teams table with a condition that track's lap_recorder field is equal to team's driver_one or driver_two ( by getting count of these ). At this point,
 -- also we should group by circuit type and teams. At the end of this process we get a table with short_name, circuit_type, and count of team's drivers' tracks.  Then by using the
 -- same table, we get max value of lap_records. Then, by checking two table's fields ( circuit_type and team_lap_recorder) are equal to each other we get results