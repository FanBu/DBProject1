-- 1
SET autocommit = 0;
INSERT INTO User VALUES (NULL,'jeremyBo','jbj',' ','password',' ');
-- does the question mean only 3 are required?
ROLLBACK;

-- 2
SELECT aid, aname, COALESCE(playcounttable.playcount, 0) AS count 
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
INSERT INTO Rating(uid, tid, time, rate) VALUES (4, 1, '2017-11-30 12:50:00', 5);
ROLLBACK;

-- 5
SELECT alid, title, time, type, count, by_uid FROM AlbumPlaylist,
(SELECT f_uid FROM Follow, User
WHERE Follow.uid = User.uid
AND uname = 'NancyInQueens') AS uidtable
WHERE AlbumPlaylist.type = 'playlist'
AND AlbumPlaylist.by_uid = uidtable.f_uid;

-- 6
SELECT tid, title, duration, genre, by_aid FROM Artist, Track 
WHERE Artist.aid = Track.by_aid
AND (MATCH(title)
AGAINST ('M*' IN BOOLEAN MODE)
OR MATCH(aname, description)
AGAINST ('M*' IN BOOLEAN MODE))
ORDER BY MATCH(title)
AGAINST ('M*' IN BOOLEAN MODE),
MATCH(aname, description)
AGAINST ('M*' IN BOOLEAN MODE) DESC;

-- 7
SELECT counttotaltable.aid AS aid1, commontable.aid2
FROM (SELECT aid, COUNT(uid) AS countuid FROM Likes GROUP BY aid) AS counttotaltable,
(SELECT likes1.aid AS aid1, likes2.aid AS aid2, COUNT(likes1.uid) AS countcommon FROM 
Likes likes1, Likes likes2
WHERE likes1.uid = likes2.uid
GROUP BY likes1.aid, likes2.aid) AS commontable
WHERE NOT counttotaltable.aid = commontable.aid2
AND counttotaltable.aid = commontable.aid1
AND counttotaltable.countuid <= commontable.countcommon * 10;

-- check similarity
SELECT counttotaltable.aid AS aid1, commontable.aid2,
commontable.countcommon / counttotaltable.countuid AS similarity
FROM (SELECT aid, COUNT(uid) AS countuid FROM Likes GROUP BY aid) AS counttotaltable,
(SELECT likes1.aid AS aid1, likes2.aid AS aid2, COUNT(likes1.uid) AS countcommon FROM 
Likes likes1, Likes likes2
WHERE NOT likes1.aid = likes2.aid
AND likes1.uid = likes2.uid
GROUP BY likes1.aid, likes2.aid) AS commontable
WHERE counttotaltable.aid = commontable.aid1
ORDER BY similarity DESC;
