-- 先创建数据库libarary
-- 推荐参考课本，使用Navicat
USE library;

-- 用户表（临时）
DROP TABLE
IF EXISTS `user`;

CREATE TABLE `user` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR (50) NOT NULL,
	`password` VARCHAR (255) NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO `user` (username, password)
VALUES
	('admin', 'admin'),
	('user1', 'user1'),
	('user2', 'user2');

-- 图书表（临时）
DROP TABLE
IF EXISTS `book`;

CREATE TABLE `book` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` VARCHAR (100) NOT NULL,
	`author` VARCHAR (50),
	`publisher` VARCHAR (50),
	PRIMARY KEY (`id`)
);