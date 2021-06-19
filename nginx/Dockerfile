FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y vim nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.pem -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 school/OU=7 wave/CN=127.0.0.1"
COPY default etc/nginx/sites-available/

EXPOSE 80 443

# ENTRYPOINT ["nginx","-g","daemon off;"]
CMD nginx -g "daemon off;"