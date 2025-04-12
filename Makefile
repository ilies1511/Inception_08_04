.DEFAULT_GOAL := all

all: reup

up:
	cd srcs/ && docker compose up --build
down:
	cd srcs/ && docker compose down
prune:
	cd srcs/ && docker system prune -af
reup: down up

.PHONY: up down prune reup
