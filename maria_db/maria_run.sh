#!/bin/sh

service mysql start
mariadb -e "CREATE DATABASE IF NOT EXISTS wp DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" &&\
mariadb -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY '12345';" &&\
mariadb -e "GRANT ALL PRIVILEGES ON wp.* TO 'wpuser'@'%' IDENTIFIED BY '12345';" &&\
mariadb -e "FLUSH PRIVILEGES;"
service mysql stop
mysqld