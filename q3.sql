SELECT team.full_name, team.team_chief, team.technical_chief, team.team_wc_count
FROM Teams team, PUMs pum
WHERE team.short_name=pum.pum_name
ORDER BY team_wc_count DESC

-- Relational algebra equation means selecting teams with 
-- short_name such that there exists a PUM with the same name.