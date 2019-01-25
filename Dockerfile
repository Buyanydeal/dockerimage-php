##############################
## Docker Image PHP-FPM 73 ###
##############################

## Image Setup ###############

FROM php:7.3-fpm
LABEL maintainer="Ruud van Engelenhoven <ruud.vanengelenhoven@gmail.com>"

## Software Installation #####
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev && \
    rm -rf /var/lib/apt/lists/*

## Install PHP extensions ####
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install pdo_pgsql && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/lib --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd
