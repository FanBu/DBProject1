-- 2
SELECT aid, aname, (playcounttable.playcount) AS count 
FROM Artist LEFT JOIN
(SELECT COUNT(Track.tid) AS playcount, by_aid 
FROM Track, PlayHistory
WHERE Track.tid = PlayHistory.tid
GROUP BY by_aid) AS playcounttable
ON Artist.aid = playcounttable.by_aid;


-- 3

SELECT * FROM
(SELECT COUNT(tid) AS n_J, by_aid
FROM Track
WHERE genre = 'Jazz'
GROUP BY by_aid) AS n_J_t,

(SELECT COUNT(tid) AS n_T, by_aid
FROM Track
GROUP BY by_aid) AS n_T_t

WHERE n_T_t.n_T / n_J_t.n_J <= 2