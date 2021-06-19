FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y wget php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-xml php7.3-mbstring

RUN mkdir -p var/www/mysite/wordpress 
# RUN mkdir -p var/www/mysite/phpmyadmin

# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc1/phpMyAdmin-5.1.0-rc1-english.tar.gz
# RUN tar xzvf phpMyAdmin-5.1.0-rc1-english.tar.gz
# RUN mv phpMyAdmin-5.1.0-rc1-english/* /var/www/mysite/phpmyadmin
# COPY config.inc.php /var/www/mysite/phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
COPY wp-config.php wordpress/
RUN mv wordpress/ /var/www/mysite/

COPY wp_run.sh ./
RUN chmod +x wp_run.sh
RUN rm -rf latest.tar.gz phpMyAdmin-5.1.0-rc1-english.tar.gz wordpress phpMyAdmin-5.1.0-rc1-english

EXPOSE 9000

CMD ./wp_run.sh
