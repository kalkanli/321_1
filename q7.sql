SELECT  circuit_type, total(clim*total_laps/1000.0) as total_km FROM Tracks WHERE circuit_country LIKE  '%a%'  AND circuit_country is not 'Italy'   GROUP BY circuit_type
