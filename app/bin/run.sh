#!/bin/bash

echo -e "# Read environment variables."
source .env

echo -e "# Restart demo database."
mysql -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOSTNAME -e "DROP DATABASE IF EXISTS $DB_NAME ; CREATE DATABASE $DB_NAME"

echo -e "# Create testing data."
mysql -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOSTNAME $DB_NAME < database/create.sql
