FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server
COPY maria_run.sh ./
RUN sed -ie 's/bind-address/#bind-address/' etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x maria_run.sh
EXPOSE 3306
CMD ./maria_run.sh