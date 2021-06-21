#!/bin/sh

cd /var/www/wordpress &&\
wp --allow-root core config --dbname=wp --dbuser=${MARIA_LGN} --dbpass=${MARIA_PWD} --dbhost=maria_db:3306 &&\
wp --allow-root core install --url="http://wbritni.42.fr/wordpress"  --title="Inception Project" --admin_user=${WP_ADMIN_LGN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_MAIL} --skip-email &&\
wp --allow-root user create ${WP_USER_LGN} ${WP_USER_MAIL} --user_pass=${WP_USER_PWD} --role=author
exec php-fpm7.3 --nodaemonize