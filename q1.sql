SELECT count(grand_prix_id) FROM GrandPrixs WHERE starting_date like '_____04%' AND ending_date like '_____04%';

-- We use regular expressions in this query and check 
-- if month part of our date string is 04 which means April.