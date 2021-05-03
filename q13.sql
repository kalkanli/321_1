SELECT  circuit_type,short_name,team_lap_recorder FROM (SELECT    Tracks.circuit_type, Teams.short_name, count(lap_recorder)  as team_lap_recorder FROM Teams,Tracks WHERE ( Teams.driver_one= Tracks.lap_recorder OR  Teams.driver_two=Tracks.lap_recorder )  GROUP by Teams.short_name ,   Tracks.circuit_type   )
WHERE circuit_type|| '-' || team_lap_recorder in
 (SELECT circuit_type|| '-' ||max(team_lap_recorder) FROM
(SELECT  short_name, circuit_type,team_lap_recorder FROM (SELECT    Tracks.circuit_type, Teams.short_name, count(lap_recorder)  as team_lap_recorder FROM Teams,Tracks WHERE ( Teams.driver_one= Tracks.lap_recorder OR  Teams.driver_two=Tracks.lap_recorder )  GROUP by Teams.short_name ,   Tracks.circuit_type   ) )
 GROUP by circuit_type) ORDER BY circuit_type,team_lap_recorder  DESC

 -- Firstly, we ensure conditions and find team_lap_recorder s , then we calculate max value of team_lap_recorder. After that we can find rows that have team_lap_recorder with the same value as max has.
-- While ensuring conditions we can find by checking track's lap_recorder value is team's driver_one or driver_two with or logical operator. Also we should group results by circuit type. When we count tracks lap_recorders with same value with team's member we get team's lap records.