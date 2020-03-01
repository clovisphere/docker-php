FROM php:7.4.3-fpm
LABEL maintainer "Clovis Mugaruka <clovis.mugaruka@gmail.com>"

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libzip-dev \
        zip \
        unzip \
        libmagickwand-dev --no-install-recommends \
        && docker-php-ext-install zip pdo_mysql mysqli \
        && rm -r /var/lib/apt/lists/*

COPY ./app /var/www/html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install composer dependencies
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /root/.composer
# Finish composer
RUN composer dump-autoload --no-scripts --no-dev --optimize
