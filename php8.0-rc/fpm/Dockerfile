FROM php:8.0-rc-fpm

LABEL maintainer="ReadyMadeHost http://readymadehost.com"

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
    libssl-dev \
    wget

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

# pcel is not avilable so using pickle
RUN wget https://github.com/FriendsOfPHP/pickle/releases/download/v0.6.0/pickle.phar && mv pickle.phar /usr/local/bin/pickle
RUN chmod +x /usr/local/bin/pickle

# Installing others dependencies
RUN pickle install apcu --defaults
RUN docker-php-ext-enable apcu

# Installing other extensions but enabled dynamically
# RUN pickle install redis --defaults // not working
# RUN docker-php-ext-enable redis
# RUN pickle install xdebug --defaults // not working
# RUN docker-php-ext-enable xdebug
# RUN pickle install mongodb --defaults // not working
# RUN docker-php-ext-enable mongodb

# Updating php.ini
ADD conf/php.ini /usr/local/etc/php/php.ini

ARG PHP_ENABLE_REDIS
ENV PHP_ENABLE_REDIS ${PHP_ENABLE_REDIS}
ARG PHP_ENABLE_XDEBUG
ENV PHP_ENABLE_XDEBUG ${PHP_ENABLE_XDEBUG}
ARG PHP_ENABLE_MONGODB
ENV PHP_ENABLE_MONGODB ${PHP_ENABLE_MONGODB}

# Add scripts
ADD docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

CMD ["/root/docker-entrypoint.sh", "php-fpm", "-F"]
