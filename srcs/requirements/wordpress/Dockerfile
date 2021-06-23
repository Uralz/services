FROM debian:buster

# Preparing
RUN apt update
RUN apt install -y procps wget mariadb-client php7.3 php7.3-fpm php7.3-mysql php7.3-cli \
            php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-xml php7.3-mbstring
RUN mkdir -p var/www/wordpress 

#Install WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN cp -r wordpress/ /var/www/

# Install WP_CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && cp wp-cli.phar /usr/local/bin/wp

# Finish
COPY wp_run.sh /var/www/wordpress
RUN chmod +x /var/www/wordpress/wp_run.sh
RUN rm -rf latest.tar.gz wordpress wp-cli.phar /var/www/html

EXPOSE 9000
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN service php7.3-fpm start && service php7.3-fpm stop
WORKDIR /var/www/wordpress
ENTRYPOINT ["./wp_run.sh"]
# ENTRYPOINT ["php-fpm7.3", "--nodaemonize"]