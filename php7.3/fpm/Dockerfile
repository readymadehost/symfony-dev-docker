FROM php:7.3-fpm

MAINTAINER ReadyMadeHost

# Installing required packages
RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-transport-https \
	libicu-dev \
    libonig-dev \
    libzip-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev

# Installing extensions
RUN docker-php-ext-install \
	pdo_mysql \
	intl \
	mbstring \
	zip \
	exif \
	pcntl \
	bcmath \
	opcache \
	gd

# Installing others dependencies
RUN pecl install redis
RUN docker-php-ext-enable redis

# Updating php.ini
ADD conf/php.ini /usr/local/etc/php/php.ini

CMD ["php-fpm", "-F"]
