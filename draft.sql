
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `uid` INT NOT NULL,
  `uname` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45),
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(10),
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uid`));


INSERT INTO `User` VALUES (1, 'Antonio Rod', 'ardd', 'rod@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (2, 'Jerry Huang', 'jh123', 'Huang@gmail.com','pass','Chicago');
INSERT INTO `User` VALUES (3, 'Brown Snow', 'snowman', 'Snow@gmail.com','pass','Miami');
INSERT INTO `User` VALUES (4, 'Guru Singh', 'guguS', 'Singh@gmail.com','pass','Miami');
INSERT INTO `User` VALUES (5, 'Ivy Yu', 'yuyuyu', 'Yu@gmail.com','pass','Chicago');
INSERT INTO `User` VALUES (6, 'Jack Smith', 'jackblack', 'Smith@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (7, 'Jane Jing', 'jjjing', 'Jing@gmail.com','pass','New York City');
INSERT INTO `User` VALUES (8, 'Tom White', 'whiteT', 'White@gmail.com','pass','New York City');



DROP TABLE IF EXISTS `Follow`;
CREATE TABLE `Follow` (
  `uid` INT NOT NULL,
  `f_uid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`uid`,`f_uid`),
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`f_uid`) REFERENCES `User` (`uid`));




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


DROP TABLE IF EXISTS `Track`;
CREATE TABLE `Track` (
  `tid` INT NOT NULL,
  `duration` INT NOT NULL,  
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `by_aid` INT NOT NULL,
  PRIMARY KEY (`tid`),
  FOREIGN KEY (`by_aid`) REFERENCES `Artist` (`aid`));

INSERT INTO `Track` VALUES (1, 180000, 'My Romance', 'Jazz', 1);
INSERT INTO `Track` VALUES (2, 200000, 'Our Song', 'Blues', 1);
INSERT INTO `Track` VALUES (3, 201000, 'Stolen Moments', 'Classical', 2);
INSERT INTO `Track` VALUES (4, 190000, 'Virgo', 'Blues', 3);
INSERT INTO `Track` VALUES (5, 170000, 'If You Could See Me Now', 'Jazz', 4);

--duration: unifyied: miliseconds


DROP TABLE IF EXISTS `Artist`;
CREATE TABLE `Artist` (
  `aid` INT NOT NULL,
  `aname` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`aid`));

INSERT INTO `Artist` VALUES (1, 'Bob Jones', 'just a singer');
INSERT INTO `Artist` VALUES (2, 'Punk Band', 'your average Punk band');
INSERT INTO `Artist` VALUES (3, 'David Earle', 'just another singer with a beard');
INSERT INTO `Artist` VALUES (4, 'Bob Jones and Jones', 'joined by Jones');


DROP TABLE IF EXISTS `AlbumPlaylist`;
CREATE TABLE `AlbumPlaylist` (
  `alid` INT NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `type` ENUM('album', 'playlist'),
  `count` INT NOT NULL,
  `by_uid` INT,
  PRIMARY KEY (`alid`),
  FOREIGN KEY (`by_uid`) REFERENCES `User` (`uid`));


INSERT INTO `AlbumPlaylist` VALUES (1, 'Songs of Rod', '2015-11-05 12:20:00','playlist',2,1);
INSERT INTO `AlbumPlaylist` VALUES (2, 'Punk Band', '2016-01-01 12:00:00','album',2000,null);
INSERT INTO `AlbumPlaylist` VALUES (3, 'Love Early', '2011-11-11 11:11:00','album',10000,null);



DROP TABLE IF EXISTS `Rating`;
CREATE TABLE `Rating` (
  `uid` INT NOT NULL,
  `tid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `rate` INT(1) NOT NULL,
  PRIMARY KEY (`uid`,`tid`),  
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`));


INSERT INTO `Rating` VALUES (1, 1, '2015-11-05 12:20:00', 4);
INSERT INTO `Rating` VALUES (1, 2, '2016-01-01 12:00:00', 5);
INSERT INTO `Rating` VALUES (1, 5, '2011-11-11 11:11:00', 1);
INSERT INTO `Rating` VALUES (2, 3, '2015-11-05 12:20:00', 3);
INSERT INTO `Rating` VALUES (3, 3, '2016-01-01 12:00:00', 4);
INSERT INTO `Rating` VALUES (4, 4, '2011-11-11 11:11:00', 4);



DROP TABLE IF EXISTS `Like`;
CREATE TABLE `Like` (
  `uid` INT NOT NULL,
  `aid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`uid`,`time`),  
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`aid`) REFERENCES `Artist` (`aid`));

INSERT INTO `Like` VALUES (2, 1, '2015-11-05 12:20:00');
INSERT INTO `Like` VALUES (2, 2, '2016-01-01 12:00:00');
INSERT INTO `Like` VALUES (3, 3, '2011-11-11 11:11:00');
INSERT INTO `Like` VALUES (7, 4, '2015-04-05 12:20:00');
-------------------------


DROP TABLE IF EXISTS `PlayHistory`;
CREATE TABLE `PlayHistory` (
  `uid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `tid` INT NOT NULL,
  `alid` INT NOT NULL,
  PRIMARY KEY (`uid`, `time`),  
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`),
  FOREIGN KEY (`alid`) REFERENCES `AlbumPlaylist` (`alid`));

INSERT INTO `PlayHistory` VALUES (3, '2015-11-05 12:20:00',4,2);
INSERT INTO `PlayHistory` VALUES (3, '2016-01-01 12:00:00',5,2);
INSERT INTO `PlayHistory` VALUES (6, '2011-11-11 11:11:00',3,1);
INSERT INTO `PlayHistory` VALUES (8, '2015-04-05 12:20:00',1,3);



DROP TABLE IF EXISTS `TrackAlbum`;
CREATE TABLE `TrackAlbum` (
  `tid` INT NOT NULL,
  `alid` INT NOT NULL,  
  `order` INT NOT NULL,
  PRIMARY KEY (`tid`,`alid`),
  FOREIGN KEY (`alid`) REFERENCES `AlbumPlaylist` (`alid`),
  FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`));

INSERT INTO `TrackAlbum` VALUES (1, 1, 1);
INSERT INTO `TrackAlbum` VALUES (2, 1, 2);
INSERT INTO `TrackAlbum` VALUES (3, 1, 3);
INSERT INTO `TrackAlbum` VALUES (4, 2, 1);




