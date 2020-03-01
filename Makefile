.PHONY: up down nginx php db
.DEFAULT_GOAL := up

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
