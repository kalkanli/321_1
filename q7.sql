SELECT circuit_type, TOTAL(clim*total_laps/1000.0) as total_km 
FROM Tracks 
WHERE circuit_country LIKE '%a%' AND circuit_country IS NOT 'Italy' 
GROUP BY circuit_type

-- circuit_country must include "a" in it and cannot be Italy. 
-- Grouping the tracks by circuit_type we can sum their total length
-- using TOTAL().
