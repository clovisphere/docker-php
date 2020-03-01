.PHONY: up down nginx web db clean
.DEFAULT_GOAL := up

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))
CONTAINERS := $(shell docker ps -a -q -f "name=booky-restful-api*")
ALL_CONTAINERS := $(shell docker ps -a -q)
ALL_IMAGES := $(shell docker images -q)

db:
	docker-compose exec db mysql -e 'DROP DATABASE IF EXISTS booky ; CREATE DATABASE booky;'
	docker-compose exec db sh -c "mysql booky < docker-entrypoint-initdb.d/create.sql"

up:
	docker-compose up --build

down:
	docker-compose down

nginx:
	docker exec -it booky-restful-api-nginx-container /bin/sh

php: 
	docker exec -it booky-restful-api-php-container bash

clean:
	docker stop $(CONTAINERS) && docker rm $(CONTAINERS)

remove-all:
	docker stop $(ALL_CONTAINERS) && docker rm $(ALL_CONTAINERS)
	docker rmi -f $(ALL_IMAGES)
	docker system prune -a --volumes -f
