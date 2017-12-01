-- 1
SET autocommit = 0;
INSERT INTO User VALUES (NULL,'jeremyBo','jbj',' ','password',' ');
-- does the question mean only 3 are required?
ROLLBACK;

-- 2
SELECT aid, aname, (playcounttable.playcount) AS count 
FROM Artist LEFT JOIN
(SELECT COUNT(Track.tid) AS playcount, by_aid 
FROM Track, PlayHistory
WHERE Track.tid = PlayHistory.tid
GROUP BY by_aid) AS playcounttable
ON Artist.aid = playcounttable.by_aid;

-- 3
SELECT Artist.aid, aname, description FROM
(SELECT COUNT(tid) AS jazzcount, by_aid
FROM Track
WHERE genre = 'Jazz'
GROUP BY by_aid) AS jazzcounttable,
(SELECT COUNT(tid) AS totalcount, by_aid
FROM Track
GROUP BY by_aid) AS totalcounttable, Artist
WHERE jazzcounttable.by_aid = totalcounttable.by_aid
AND jazzcounttable.by_aid = Artist.aid
AND 2 * jazzcount >= totalcount;

-- 4
SET autocommit = 0;
INSERT INTO `Rating` VALUES (4, 4, '2017-11-30 12:50:00', 5);

ROLLBACK;

-- 5
SELECT alid, title, time, type, count, by_uid FROM AlbumPlaylist,
(SELECT f_uid FROM Follow, User
WHERE Follow.uid = User.uid
AND uname = 'NancyInQueens') AS uidtable
WHERE AlbumPlaylist.type = 'playlist'
AND AlbumPlaylist.by_uid = uidtable.f_uid;

-- 6
-- Better use CONTAINS? returns ranks using AND, NEAR, ACCUM
-- But it's a SQL thing
SELECT tid FROM Track
WHERE CONTAINS(Track.title,'"Our" OR "Virgo" OR "Stolen"')



-- what does it mean by some set?
-- match at least of one element in a set or all elements in a set

SELECT Track_table.title 
FROM
	(SELECT * 
	FROM Track,
		(SELECT aid 
		FROM Artist
		WHERE aname LIKE '%c%'
		OR aname LIKE '%l%') 
		AS aid_table
	WHERE aid_table.aid = Track.by_aid) 
	AS A_T_table

	full join 

	(SELECT * 
	FROM Track
	WHERE title LIKE '%c%'
	OR title LIKE '%l%') 
	AS Track_table
	
	ON A_T_table.tid = Track_table.tid

-- 7
SELECT aid FROM

(SELECT uid 
FROM Likes
GROUP BY aid) AS table1,

(SELECT uid 
FROM Likes
GROUP BY aid) AS table2

WHERE table1.uid = table2.uid 

-- this is total number of Fans
(SELECT COUNT(uid) 
FROM Likes 
GROUP BY aid) n_uid
















