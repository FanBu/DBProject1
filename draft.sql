
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




INSERT INTO `follow` VALUES (1, 2);
INSERT INTO `follow` VALUES (1, 3);
INSERT INTO `follow` VALUES (1, 8);
INSERT INTO `follow` VALUES (2, 3);
INSERT INTO `follow` VALUES (2, 4);
INSERT INTO `follow` VALUES (2, 5);
INSERT INTO `follow` VALUES (3, 6);
INSERT INTO `follow` VALUES (3, 7);
INSERT INTO `follow` VALUES (4, 5);
INSERT INTO `follow` VALUES (6, 7);
INSERT INTO `follow` VALUES (7, 8);
INSERT INTO `follow` VALUES (8, 1);


DROP TABLE IF EXISTS `Track`;
CREATE TABLE `Track` (
  `tid` INT NOT NULL,
  `duration` INT NOT NULL,  
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `by_aid` INT NOT NULL,
  PRIMARY KEY (`tid`),
  FOREIGN KEY (`by_aid`) REFERENCES `Artist` (`aid`));

INSERT INTO `Track` VALUES (1, 180000, 'Teriyaki Chicken', 'Jazz', 1);
INSERT INTO `Track` VALUES (2, 200000, 'Crab Club', 'Blues', 1);
INSERT INTO `Track` VALUES (3, 201000, 'Peking Track', 'Classical', 2);
INSERT INTO `Track` VALUES (4, 190000, 'Indian Kitchen', 'Blues', 3);
INSERT INTO `Track` VALUES (5, 170000, 'Sushi Bar', 'Jazz', 4);

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
  `title` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `type` ENUM('album', 'playlist'),
  `count` INT NOT NULL,
  `by_uid` INT,
  PRIMARY KEY (`alid`),
  FOREIGN KEY (`by_uid`) REFERENCES `User` (`uid`));


DROP TABLE IF EXISTS `Rating`;
CREATE TABLE `Rating` (
  `uid` INT NOT NULL,
  `tid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `rate` INT(1) NOT NULL,
  PRIMARY KEY (`uid`,`tid`),  
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`));

DROP TABLE IF EXISTS `Like`;
CREATE TABLE `Like` (
  `uid` INT NOT NULL,
  `aid` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`uid`,`time`),  
  FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  FOREIGN KEY (`aid`) REFERENCES `Artist` (`aid`));


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

DROP TABLE IF EXISTS `Trackalbum`;
CREATE TABLE `Trackalbum` (
  `tid` INT NOT NULL,
  `alid` INT NOT NULL,  
  `order` INT NOT NULL,
  PRIMARY KEY (`tid`,`alid`),
  FOREIGN KEY (`alid`) REFERENCES `AlbumPlaylist` (`alid`),
  FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`));


INSERT INTO `album` VALUES (1, 'Rod liked songs', '2017-11-05', 1);
INSERT INTO `album` VALUES (2, 'Crab People', '2005-12-01', 1);
INSERT INTO `album` VALUES (3, 'Peking Peking', '2011-07-12', 2);
INSERT INTO `album` VALUES (4, 'Hell Kitchen', '2008-09-05', 3);
INSERT INTO `album` VALUES (5, 'Sushi Feast', '2001-01-03', 4);


