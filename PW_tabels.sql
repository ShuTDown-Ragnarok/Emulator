CREATE DATABASE pw CHARACTER SET utf8 COLLATE utf8_general_ci;

use pw;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

DROP TABLE IF EXISTS `auth`;
CREATE TABLE IF NOT EXISTS `auth` (
  `userid` int(11) NOT NULL default '0',
  `zoneid` int(11) NOT NULL default '0',
  `rid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userid`,`zoneid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `forbid`;
CREATE TABLE IF NOT EXISTS `forbid` (
  `userid` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  `ctime` datetime NOT NULL,
  `forbid_time` int(11) NOT NULL default '0',
  `reason` blob NOT NULL,
  `gmroleid` int(11) default '0',
  PRIMARY KEY  (`userid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iplimit`;
CREATE TABLE IF NOT EXISTS `iplimit` (
  `uid` int(11) NOT NULL default '0',
  `ipaddr1` int(11) default '0',
  `ipmask1` varchar(2) default '',
  `ipaddr2` int(11) default '0',
  `ipmask2` varchar(2) default '',
  `ipaddr3` int(11) default '0',
  `ipmask3` varchar(2) default '',
  `enable` char(1) default '',
  `lockstatus` char(1) default '',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `point`;
CREATE TABLE IF NOT EXISTS `point` (
  `uid` int(11) NOT NULL default '0',
  `aid` int(11) NOT NULL default '0',
  `time` int(11) NOT NULL default '0',
  `zoneid` int(11) default '0',
  `zonelocalid` int(11) default '0',
  `accountstart` datetime default NULL,
  `lastlogin` datetime default NULL,
  `enddate` datetime default NULL,
  PRIMARY KEY  (`uid`,`aid`),
  KEY `IX_point_aidzoneid` (`aid`,`zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `usecashlog`;
CREATE TABLE IF NOT EXISTS `usecashlog` (
  `userid` int(11) NOT NULL default '0',
  `zoneid` int(11) NOT NULL default '0',
  `sn` int(11) NOT NULL default '0',
  `aid` int(11) NOT NULL default '0',
  `point` int(11) NOT NULL default '0',
  `cash` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `creatime` datetime NOT NULL,
  `fintime` datetime NOT NULL,
  KEY `IX_usecashlog_creatime` (`creatime`),
  KEY `IX_usecashlog_uzs` (`userid`,`zoneid`,`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `usecashnow`;
CREATE TABLE IF NOT EXISTS `usecashnow` (
  `userid` int(11) NOT NULL default '0',
  `zoneid` int(11) NOT NULL default '0',
  `sn` int(11) NOT NULL default '0',
  `aid` int(11) NOT NULL default '0',
  `point` int(11) NOT NULL default '0',
  `cash` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `creatime` datetime NOT NULL,
  PRIMARY KEY  (`userid`,`zoneid`,`sn`),
  KEY `IX_usecashnow_creatime` (`creatime`),
  KEY `IX_usecashnow_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL default '',
  `passwd` varchar(64) NOT NULL,
  `Prompt` varchar(32) NOT NULL default '',
  `answer` varchar(32) NOT NULL default '',
  `truename` varchar(32) NOT NULL default '',
  `idnumber` varchar(32) NOT NULL default '',
  `email` varchar(64) NOT NULL default '',
  `mobilenumber` varchar(32) default '',
  `province` varchar(32) default '',
  `city` varchar(32) default '',
  `phonenumber` varchar(32) default '',
  `address` varchar(64) default '',
  `postalcode` varchar(8) default '',
  `gender` int(11) default '0',
  `birthday` datetime default NULL,
  `creatime` datetime NOT NULL,
  `qq` varchar(32) default '',
  `passwd2` varchar(64) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `IX_users_name` (`name`),
  KEY `IX_users_creatime` (`creatime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
