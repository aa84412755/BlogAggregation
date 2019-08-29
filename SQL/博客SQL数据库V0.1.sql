CREATE TABLE `blogArticles` (
`articlesId` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id',
`bloggerId` int(10) NOT NULL COMMENT '外键博主id',
`tagId` int(11) NOT NULL COMMENT '文章标签id，关联标签表',
`articlesUrl` varchar(255) NOT NULL COMMENT '文章路径',
`createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`articlesId`) 
)
COMMENT = '博客文章表';
CREATE TABLE `blogger` (
`bloggerId` int(10) NOT NULL AUTO_INCREMENT COMMENT '博主(我们)ID',
`nickName` varchar(100) NOT NULL COMMENT '昵称',
`passWord` varchar(50) NOT NULL COMMENT '密码',
`sex` bit(1) NULL COMMENT '性别 1-男、0-女',
`birthday` date NULL COMMENT '生日',
`email` varchar(50) NULL COMMENT '邮箱',
`QQ` varchar(50) NULL COMMENT 'QQ',
`WeChat` varchar(50) NULL COMMENT '微信号',
`microBlog` varchar(50) NULL COMMENT '微博号',
`gitHub` varchar(50) NULL COMMENT 'gitHub账号',
`createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`bloggerId`) 
)
COMMENT = '博主(我们)表';
CREATE TABLE `tourist` (
`touristId` int(10) NOT NULL AUTO_INCREMENT COMMENT '游客ID',
`visitingCities` varchar(100) NULL COMMENT '访问地址',
`IPAddress` varchar(20) NULL COMMENT 'IP地址',
`MACAddress` varchar(20) NULL COMMENT 'MAC地址',
`createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`touristId`) 
)
COMMENT = '游客表
暂时不需要，用于后期拓展';
CREATE TABLE `tag` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章标签id（自增）',
`tagName` varchar(50) NOT NULL COMMENT '标签名',
`createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`) 
)
COMMENT = '文章标签表';
CREATE TABLE `tagArticlesRelational` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
`tagId` int(11) NOT NULL COMMENT '标签表id',
`articlesId` int(11) NOT NULL COMMENT '文章表id',
`createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`, `tagId`, `articlesId`) 
)
COMMENT = '文章和标签关系表，多对多关系';

ALTER TABLE `blogArticles` ADD CONSTRAINT `fk_blogArticles_blogger_1` FOREIGN KEY (`bloggerId`) REFERENCES `blogger` (`bloggerId`);
ALTER TABLE `tagArticlesRelational` ADD CONSTRAINT `fk_tagArticlesRelational_tag_1` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`);
ALTER TABLE `tagArticlesRelational` ADD CONSTRAINT `fk_tagArticlesRelational_blogArticles_1` FOREIGN KEY (`articlesId`) REFERENCES `blogArticles` (`articlesId`);

