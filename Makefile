.DEFAULT_GOAL := all

all: reup

up:
	cd srcs/ && docker-compose up --build
down:
	cd srcs/ && docker-compose down
prune:
	cd srcs/ && docker system prune -af
reup: down up

del_volumes:
	sudo rm -rf ${HOME}/data/wordpress/* && sudo rm -rf ${HOME}/data/mariadb/*

clean: del_volumes rm_vol prune

rm_vol:
	- docker rm volume mariadb 
	- docker rm volume wordpress 

.PHONY: up down prune reup del_volumes clean
