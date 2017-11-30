-- 2
SELECT aid, aname, (n_plays_t.n_plays) AS played 
FROM Artist
LEFT JOIN

(SELECT COUNT(tid) AS n_plays,by_aid 
FROM Track
GROUP BY by_aid) AS n_plays_t

ON Artist.aid = n_plays_t.by_aid


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