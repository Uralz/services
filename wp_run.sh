#!/bin/sh

echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
service php7.3-fpm start
cd var/www/mysite/wordpress/
wp --allow-root core config --dbname=wp --dbuser=wpuser --dbpass=12345 --dbhost=maria_db:3306
wp --allow-root core install --url="127.0.0.1"  --title="wbritni's inception" --admin_user="wbritni1" --admin_password="12345" --admin_email="wbritni@student.21-school.ru" --path=/var/www/mysite/wordpress

service php7.3-fpm stop && php-fpm7.3 --nodaemonize