INSERT INTO `User` VALUES (1, 'NancyInQueens', 'Nacy', 'nacy@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (2, 'jh123', 'Jerry Huang', 'Huang@gmail.com','pass','Chicago');
INSERT INTO `User` VALUES (3, 'snowman', 'Brown Snow', 'Snow@gmail.com','pass','Miami');
INSERT INTO `User` VALUES (4, 'guguS','Guru Singh', 'Singh@gmail.com','pass','Miami');
INSERT INTO `User` VALUES (5, 'yuyuyu', 'Ivy Yu', 'Yu@gmail.com','pass','Chicago');
INSERT INTO `User` VALUES (6, 'jackblack', 'Jack Smith', 'Smith@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (7, 'jjjing', 'Jane Jing', 'Jing@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (8, 'whiteT', 'Tom White', 'White@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (9, 'ardd', 'Antonio Rod', 'rod@gmail.com','pass','New York City');

INSERT INTO `Follow` VALUES (1, 2, '2017-11-05 12:20:00');
INSERT INTO `Follow` VALUES (1, 3, '2016-10-01 17:40:00');
INSERT INTO `Follow` VALUES (1, 8, '2016-10-05 12:20:00');
INSERT INTO `Follow` VALUES (2, 3, '2016-05-11 18:10:00');
INSERT INTO `Follow` VALUES (2, 4, '2016-02-01 14:00:00');
INSERT INTO `Follow` VALUES (2, 5, '2017-01-23 12:20:00');
INSERT INTO `Follow` VALUES (3, 6, '2017-01-29 09:20:00');
INSERT INTO `Follow` VALUES (3, 7, '2017-09-10 14:20:00');
INSERT INTO `Follow` VALUES (4, 5, '2017-09-12 20:20:00');
INSERT INTO `Follow` VALUES (6, 7, '2017-09-15 21:50:00');
INSERT INTO `Follow` VALUES (7, 8, '2017-02-05 12:20:00');
INSERT INTO `Follow` VALUES (8, 1, '2017-11-05 02:20:00');

INSERT INTO `Artist` VALUES (1, 'Bob Jones', 'just a singer');
INSERT INTO `Artist` VALUES (2, 'Punk Band', 'your average Punk band');
INSERT INTO `Artist` VALUES (3, 'David Earle', 'just another singer with a beard');
INSERT INTO `Artist` VALUES (4, 'Bob Jones and Jones', 'joined by Jones');
INSERT INTO `Artist` VALUES (5, 'Fan Bu', 'An artist in the future');

INSERT INTO `Track` VALUES (1, 180000, 'My Romance', 'Jazz', 1);
INSERT INTO `Track` VALUES (2, 200000, 'Our Song', 'Blues', 1);
INSERT INTO `Track` VALUES (3, 201000, 'Stolen Moments', 'Classical', 2);
INSERT INTO `Track` VALUES (4, 190000, 'Virgo', 'Blues', 3);
INSERT INTO `Track` VALUES (5, 170000, 'If You Could See Me Now', 'Jazz', 4);

INSERT INTO `AlbumPlaylist` VALUES (1, 'Songs of Rod', '2015-11-05 12:20:00','playlist',2,2);
INSERT INTO `AlbumPlaylist` VALUES (2, 'Punk Band', '2016-01-01 12:00:00','album',2000,null);
INSERT INTO `AlbumPlaylist` VALUES (3, 'Love Early', '2011-11-11 11:11:00','album',10000,null);

INSERT INTO `Rating` VALUES (1, 1, '2015-11-05 12:20:00', 4);
INSERT INTO `Rating` VALUES (1, 2, '2016-01-01 12:00:00', 5);
INSERT INTO `Rating` VALUES (1, 5, '2011-11-11 11:11:00', 1);
INSERT INTO `Rating` VALUES (2, 3, '2015-11-05 12:20:00', 3);
INSERT INTO `Rating` VALUES (3, 3, '2016-01-01 12:00:00', 4);
INSERT INTO `Rating` VALUES (4, 4, '2011-11-11 11:11:00', 4);

INSERT INTO `Likes` VALUES (2, 1, '2015-11-05 12:20:00');
INSERT INTO `Likes` VALUES (2, 2, '2016-01-01 12:00:00');
INSERT INTO `Likes` VALUES (3, 3, '2011-11-11 11:11:00');
INSERT INTO `Likes` VALUES (3, 2, '2013-11-11 11:11:00');
INSERT INTO `Likes` VALUES (7, 4, '2015-04-05 12:20:00');

INSERT INTO `PlayHistory` VALUES (3, '2015-11-05 12:20:00',4,2);
INSERT INTO `PlayHistory` VALUES (3, '2016-01-01 12:00:00',5,2);
INSERT INTO `PlayHistory` VALUES (6, '2011-11-11 11:11:00',3,1);
INSERT INTO `PlayHistory` VALUES (8, '2015-04-05 12:20:00',1,3);

INSERT INTO `TrackAlbum` VALUES (1, 1, 1);
INSERT INTO `TrackAlbum` VALUES (2, 1, 2);
INSERT INTO `TrackAlbum` VALUES (3, 1, 3);
INSERT INTO `TrackAlbum` VALUES (4, 2, 1);