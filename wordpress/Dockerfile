FROM debian:buster

# Preparing
RUN apt update -y && apt upgrade -y
RUN apt install -y wget mariadb-client php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli \
            php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-xml php7.3-mbstring
RUN mkdir -p var/www/mysite/wordpress 

#Install WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
# COPY wp-config.php wordpress/
RUN mv wordpress/ /var/www/mysite/

# Install WP_CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Finish
COPY wp_run.sh ./
RUN chmod +x wp_run.sh
RUN rm -rf latest.tar.gz phpMyAdmin-5.1.0-rc1-english.tar.gz wordpress phpMyAdmin-5.1.0-rc1-english

EXPOSE 9000

CMD ./wp_run.sh
