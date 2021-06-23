#!/bin/bash

service mysql start
mariadb -e "CREATE DATABASE IF NOT EXISTS wp DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" &&\
mariadb -e "CREATE USER '${MARIA_LGN}'@'localhost' IDENTIFIED BY '${MARIA_PWD}';" &&\
mariadb -e "GRANT ALL PRIVILEGES ON wp.* TO '${MARIA_LGN}'@'%' IDENTIFIED BY '${MARIA_PWD}';" &&\
mariadb -e "FLUSH PRIVILEGES;"
service mysql stop
exec mysqld