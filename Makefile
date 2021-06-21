DOMAIN_NAME=wbritni.42.fr
IP_ADDR=127.0.0.1


all: hosts install

install:
	cd srcs &&\
	mkdir -p ${HOME}/data/maria_db ${HOME}/data/wordpress &&\
	docker-compose up -d

hosts:
	echo '$(IP_ADDR) $(DOMAIN_NAME)' >> /etc/hosts

stop:
	cd srcs && docker-compose stop

restart:
	cd srcs && docker-compose restart

fclean: stop
	cd srcs && docker system prune -y && docker volume rm $(docker volume ls -q) &&\
	sudo rm -rf ${HOME}/data

.PHONY: install stop restart fclean