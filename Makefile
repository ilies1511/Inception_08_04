.DEFAULT_GOAL := all

all: reup

up:
	cd srcs/ && docker compose up --build
down:
	cd srcs/ && docker compose down
prune: del_volumes
	cd srcs/ && docker system prune -af
reup: down up

del_volumes:
	rm -rf srcs/db && rm -rf srcs/web

.PHONY: up down prune reup del_volumes
