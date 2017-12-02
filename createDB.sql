CREATE TABLE `Artist` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `Track` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `duration` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `by_aid` int(11) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `by_aid` (`by_aid`),
  CONSTRAINT `Track_ibfk_1` FOREIGN KEY (`by_aid`) REFERENCES `Artist` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `User` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(10) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `AlbumPlaylist` (
  `alid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('album','playlist') DEFAULT NULL,
  `count` int(11) NOT NULL,
  `by_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`alid`),
  KEY `by_uid` (`by_uid`),
  CONSTRAINT `AlbumPlaylist_ibfk_1` FOREIGN KEY (`by_uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `Follow` (
  `uid` int(11) NOT NULL,
  `f_uid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`f_uid`),
  KEY `f_uid` (`f_uid`),
  CONSTRAINT `Follow_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `Follow_ibfk_2` FOREIGN KEY (`f_uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Likes` (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`time`),
  KEY `aid` (`aid`),
  CONSTRAINT `Likes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `Likes_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Artist` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PlayHistory` (
  `uid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tid` int(11) NOT NULL,
  `alid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`time`),
  KEY `tid` (`tid`),
  KEY `alid` (`alid`),
  CONSTRAINT `PlayHistory_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `PlayHistory_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`),
  CONSTRAINT `PlayHistory_ibfk_3` FOREIGN KEY (`alid`) REFERENCES `AlbumPlaylist` (`alid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Rating` (
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rate` int(1) NOT NULL,
  PRIMARY KEY (`uid`,`tid`),
  KEY `tid` (`tid`),
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `Rating_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TrackAlbum` (
  `tid` int(11) NOT NULL,
  `alid` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`alid`),
  KEY `alid` (`alid`),
  CONSTRAINT `TrackAlbum_ibfk_1` FOREIGN KEY (`alid`) REFERENCES `AlbumPlaylist` (`alid`),
  CONSTRAINT `TrackAlbum_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `Track` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;