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