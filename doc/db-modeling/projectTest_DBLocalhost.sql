-- 로컬 호스트에서 테스트

-- mysql -u root -p
-- Enter password: 암호입력

CREATE USER 'movieInSta'@'localhost' IDENTIFIED BY 'bit504';

CREATE DATABASE mvdb
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;


GRANT ALL ON mvdb.* TO 'movieInSta'@'localhost';


set storage_engine=innodb;
