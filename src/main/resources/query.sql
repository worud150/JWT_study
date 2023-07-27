-- sec_todo 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sec_todo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sec_todo`;


CREATE TABLE IF NOT EXISTS `t_user` (
    `iuser` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `uid` varchar(30) NOT NULL,
    `upw` varchar(100) NOT NULL,
    `name` varchar(10) NOT NULL,
    `role` varchar(10) NOT NULL,
    `created_at` datetime DEFAULT current_timestamp(),
    `updated_at` datetime DEFAULT current_timestamp(),
    PRIMARY KEY (`iuser`)
);

CREATE TABLE if NOT EXISTS `t_user_token`(
     iuser BIGINT UNSIGNED NOT NULL,
     ip VARCHAR(15) NOT NULL,
     access_token VARCHAR(200) NOT NULL,
     refresh_token VARCHAR(200) NOT NULL,
     created_at DATETIME DEFAULT CURRENT_TIMESTAMP(),
     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
     PRIMARY KEY(iuser, ip),
     FOREIGN KEY(iuser) REFERENCES t_user(`iuser`)
);


CREATE TABLE IF NOT EXISTS `t_todo` (
    `itodo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `ctnt` varchar(100) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `del_yn` tinyint(4) DEFAULT 0 CHECK (`del_yn` in (0,1)),
    `pic` varchar(100) DEFAULT NULL,
    `finish_yn` tinyint(4) DEFAULT 0 CHECK (`finish_yn` in (0,1)),
    `finished_at` datetime DEFAULT NULL,
    `iuser` bigint(20) unsigned NOT NULL,
    PRIMARY KEY (`itodo`),
    KEY `iuser` (`iuser`),
    CONSTRAINT `t_todo_ibfk_1` FOREIGN KEY (`iuser`) REFERENCES `t_user` (`iuser`)
);





