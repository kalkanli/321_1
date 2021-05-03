SELECT DISTINCT pum.pum_name
FROM PUMs pum, Teams team
WHERE (pum.buyer_one IN (SELECT t.team_id FROM Teams t WHERE t.team_wc_count>0))
AND (pum.buyer_two IS NULL OR pum.buyer_two IN (SELECT t.team_id FROM Teams t WHERE t.team_wc_count>0))
AND (pum.buyer_three IS NULL OR pum.buyer_three IN (SELECT t.team_id FROM Teams t WHERE t.team_wc_count>0))
AND (pum.buyer_four IS NULL OR pum.buyer_four IN (SELECT t.team_id FROM Teams t WHERE t.team_wc_count>0))

-- A buyer of PUM can either be null or has to have a world championship.
-- So we are looking for PUMs which all of their buyers are either null or have championship.