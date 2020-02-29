FROM php:7.4.3-fpm
LABEL maintainer "Clovis Mugaruka <clovis.mugaruka@gmail.com>"


RUN apt-get update && apt-get install -y libmcrypt-dev \
    libmagickwand-dev --no-install-recommends \
    && docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
