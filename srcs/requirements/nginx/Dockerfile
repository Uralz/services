FROM debian:buster

RUN apt update

RUN apt install -y vim nginx openssl procps
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.pem -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 school/OU=7 wave/CN=wbritni.42.fr"
COPY default etc/nginx/sites-available/

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;"]