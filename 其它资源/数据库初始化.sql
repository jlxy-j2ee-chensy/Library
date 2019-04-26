-- 先创建数据库libarary
-- 推荐参考课本，使用Navicat
USE library;

-- 用户表（临时）
DROP TABLE
IF EXISTS `user`;

CREATE TABLE `user` (
	`id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR (50) NOT NULL COMMENT '用户名',
	`password` VARCHAR (255) NOT NULL COMMENT '密码',
	`role` enum ('admin', 'member') NOT NULL DEFAULT 'member' COMMENT '用户角色',
	`register_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '注册时间',
	`login_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '登录时间',
	PRIMARY KEY (`id`)
);

INSERT INTO `user` (username, PASSWORD, role)
VALUES
	('admin', 'admin', 'admin'),
	('user1', 'user1', 'member'),
	('user2', 'user2', 'member');

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