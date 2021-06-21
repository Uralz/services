FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y wget

RUN mkdir -p var/www/phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc1/phpMyAdmin-5.1.0-rc1-english.tar.gz
RUN tar xzvf phpMyAdmin-5.1.0-rc1-english.tar.gz
RUN cp -r phpMyAdmin-5.1.0-rc1-english/* /var/www/mysite/phpmyadmin && rm -rf phpMyAdmin-5.1.0-rc1-english
COPY config.inc.php /var/www/mysite/phpmyadmin