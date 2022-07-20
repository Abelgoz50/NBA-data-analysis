SELECT * FROM NBAProject..NBAdata

-- Break out year for insertion into new column

SELECT year_id,
SUBSTRING(year_id, 1, 4) AS years
FROM NBAProject..NBAdata

ALTER TABLE NBAdata
ADD years INT

UPDATE NBAdata
SET years = SUBSTRING(year_id, 1, 4)

-- Move string along to fran_id, then replace year_id with years

UPDATE NBAdata
SET year_id = years

-- Remove years column

ALTER TABLE NBAdata
DROP COLUMN years


-- Break out team name for insertion into fran_id column

SELECT SUBSTRING(year_id, 6, len(year_id)) AS rest
FROM NBAProject..NBAdata

UPDATE NBAdata
SET fran_id = SUBSTRING(year_id, 6, len(year_id))
FROM NBAProject..NBAdata

SELECT fran_id, SUBSTRING(fran_id, 1, CHARINDEX('.', fran_id)-1)
FROM NBAProject..NBAdata

UPDATE NBAdata
SET fran_id = SUBSTRING(fran_id, 1, CHARINDEX('.', fran_id)-1)
FROM NBAProject..NBAdata


-- Move the string along to avg_pts

SELECT fran_id, SUBSTRING(fran_id, CHARINDEX('.', fran_id)+1, len(fran_id))
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_pts = SUBSTRING(fran_id, CHARINDEX('.', fran_id)+1, len(fran_id))
FROM NBAProject..NBAdata


-- MOVE THE STRING ALONG TO avg_opp_pts

-- Split string at '.' for movement to next column

SELECT avg_pts, SUBSTRING(avg_pts, CHARINDEX('.', avg_pts)+1, len(avg_pts))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET avg_opp_pts = SUBSTRING(avg_pts, CHARINDEX('.', avg_pts)+1, len(avg_pts))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_pts

-- Isolate avg_pts

SELECT avg_pts, SUBSTRING(avg_pts, 1, CHARINDEX('.', avg_pts)-1)
FROM NBAProject..NBAdata

-- Replace avg_pts string with only avg_pts

UPDATE NBAdata
SET avg_pts = SUBSTRING(avg_pts, 1, CHARINDEX('.', avg_pts)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_pts, REPLACE(avg_pts, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_pts = REPLACE(avg_pts, '@', '.')
FROM NBAProject..NBAdata

--================================================================================

SELECT * FROM NBAProject..NBAdata

-- MOVE THE STRING ALONG TO avg_elo_n

-- Split string at '.' for movement to next column

SELECT avg_opp_pts, SUBSTRING(avg_opp_pts, CHARINDEX('.', avg_opp_pts)+1, len(avg_opp_pts))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET avg_elo_n = SUBSTRING(avg_opp_pts, CHARINDEX('.', avg_opp_pts)+1, len(avg_opp_pts))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_opp_pts

-- Isolate avg_opp_pts

SELECT avg_opp_pts, SUBSTRING(avg_opp_pts, 1, CHARINDEX('.', avg_opp_pts)-1)
FROM NBAProject..NBAdata

-- Replace avg_opp_pts string with only avg_opp_pts

UPDATE NBAdata
SET avg_opp_pts = SUBSTRING(avg_opp_pts, 1, CHARINDEX('.', avg_opp_pts)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_opp_pts, REPLACE(avg_opp_pts, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_opp_pts = REPLACE(avg_opp_pts, '@', '.')
FROM NBAProject..NBAdata


--================================================================================

SELECT * FROM NBAProject..NBAdata

-- MOVE THE STRING ALONG TO avg_opp_elo_n

-- Split string at '.' for movement to next column

SELECT avg_elo_n, SUBSTRING(avg_elo_n, CHARINDEX('.', avg_elo_n)+1, len(avg_elo_n))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET avg_opp_elo_n = SUBSTRING(avg_elo_n, CHARINDEX('.', avg_elo_n)+1, len(avg_elo_n))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_elo_n

-- Isolate avg_elo_n

SELECT avg_elo_n, SUBSTRING(avg_elo_n, 1, CHARINDEX('.', avg_elo_n)-1)
FROM NBAProject..NBAdata

-- Replace avg_elo_n string with only avg_elo_n

UPDATE NBAdata
SET avg_elo_n = SUBSTRING(avg_elo_n, 1, CHARINDEX('.', avg_elo_n)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_elo_n, REPLACE(avg_elo_n, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_elo_n = REPLACE(avg_elo_n, '@', '.')
FROM NBAProject..NBAdata


--================================================================================

SELECT * FROM NBAProject..NBAdata

-- MOVE THE STRING ALONG TO avg_pts_differential

-- Split string at '.' for movement to next column

SELECT avg_opp_elo_n, SUBSTRING(avg_opp_elo_n, CHARINDEX('.', avg_opp_elo_n)+1, len(avg_opp_elo_n))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET avg_pts_differential = SUBSTRING(avg_opp_elo_n, CHARINDEX('.', avg_opp_elo_n)+1, len(avg_opp_elo_n))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_opp_elo_n

-- Isolate avg_opp_elo_n

SELECT avg_opp_elo_n, SUBSTRING(avg_opp_elo_n, 1, CHARINDEX('.', avg_opp_elo_n)-1)
FROM NBAProject..NBAdata

-- Replace avg_opp_elo_n string with only avg_opp_elo_n

UPDATE NBAdata
SET avg_opp_elo_n = SUBSTRING(avg_opp_elo_n, 1, CHARINDEX('.', avg_opp_elo_n)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_opp_elo_n, REPLACE(avg_opp_elo_n, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_opp_elo_n = REPLACE(avg_opp_elo_n, '@', '.')
FROM NBAProject..NBAdata


--================================================================================

SELECT * FROM NBAProject..NBAdata

-- MOVE THE STRING ALONG TO avg_elo_differential

-- Split string at '.' for movement to next column

SELECT avg_pts_differential, SUBSTRING(avg_pts_differential, CHARINDEX('.', avg_pts_differential)+1, len(avg_pts_differential))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET avg_elo_differential = SUBSTRING(avg_pts_differential, CHARINDEX('.', avg_pts_differential)+1, len(avg_pts_differential))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_pts_differential

-- Isolate avg_pts_differential

SELECT avg_pts_differential, SUBSTRING(avg_pts_differential, 1, CHARINDEX('.', avg_pts_differential)-1)
FROM NBAProject..NBAdata

-- Replace avg_pts_differential string with only avg_pts_differential

UPDATE NBAdata
SET avg_pts_differential = SUBSTRING(avg_pts_differential, 1, CHARINDEX('.', avg_pts_differential)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_pts_differential, REPLACE(avg_pts_differential, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_pts_differential = REPLACE(avg_pts_differential, '@', '.')
FROM NBAProject..NBAdata


--================================================================================

SELECT * FROM NBAProject..NBAdata

-- MOVE THE STRING ALONG TO total_wins

-- Split string at '.' for movement to next column

SELECT avg_elo_differential, SUBSTRING(avg_elo_differential, CHARINDEX('.', avg_elo_differential)+1, len(avg_elo_differential))
FROM NBAProject..NBAdata

-- Move the split

UPDATE NBAdata
SET total_wins = SUBSTRING(avg_elo_differential, CHARINDEX('.', avg_elo_differential)+1, len(avg_elo_differential))
FROM NBAProject..NBAdata

-- TRUNCATE STRING LEAVING ONLY avg_elo_differential

-- Isolate avg_elo_differential

SELECT avg_elo_differential, SUBSTRING(avg_elo_differential, 1, CHARINDEX('.', avg_elo_differential)-1)
FROM NBAProject..NBAdata

-- Replace avg_elo_differential string with only avg_elo_differential

UPDATE NBAdata
SET avg_elo_differential = SUBSTRING(avg_elo_differential, 1, CHARINDEX('.', avg_elo_differential)-1)
FROM NBAProject..NBAdata

-- Replace @ with .

SELECT avg_elo_differential, REPLACE(avg_elo_differential, '@', '.')
FROM NBAProject..NBAdata

UPDATE NBAdata
SET avg_elo_differential = REPLACE(avg_elo_differential, '@', '.')
FROM NBAProject..NBAdata