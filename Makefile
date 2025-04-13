.DEFAULT_GOAL := all

all: reup

up:
	cd srcs/ && docker compose up --build
down:
	cd srcs/ && docker compose down
prune:
	cd srcs/ && docker system prune -af
reup: down up

del_volumes:
	rm -rf srcs/db && rm -rf srcs/web

clean: del_volumes prune

.PHONY: up down prune reup del_volumes clean
