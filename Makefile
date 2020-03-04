.PHONY: up down nginx
.DEFAULT_GOAL := up

db:
	docker-compose exec db mysql -e 'DROP DATABASE IF EXISTS demo ; CREATE DATABASE demo;'
	docker-compose exec db sh -c "mysql booky < docker-entrypoint-initdb.d/create.sql"

up:
	docker-compose up -d --build

down:
	docker-compose down
