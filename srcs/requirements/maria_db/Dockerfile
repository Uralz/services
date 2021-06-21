FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server procps
COPY maria_run.sh ./
RUN sed -ie 's/bind-address/#bind-address/' etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x maria_run.sh
EXPOSE 3306
ENTRYPOINT ["./maria_run.sh"]