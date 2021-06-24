DOMAIN_NAME=wbritni.42.fr
IP_ADDR=127.0.0.1


all: hosts install

wpclean: stop
	docker rm wordpress nginx maria_db
	docker rmi wordpress
	docker volume rm wp_web
	sudo rm -rf ~/data/
	
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
	cd srcs && docker system prune && docker rmi maria_db nginx wordpress 
	docker volume rm wp_web wp_db && sudo rm -rf ${HOME}/data

.PHONY: install stop restart fclean