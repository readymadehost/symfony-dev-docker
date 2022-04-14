FROM php:8.0-fpm

LABEL maintainer="ReadyMadeHost http://readymadehost.com"

# Installing required packages
RUN apt-get update
RUN apt-get install --no-install-recommends -y procps \
	curl \
	git \
	vim \
	zip \
	unzip \
	wget

# Installing extensions
RUN curl -L https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
    -o /usr/local/bin/install-php-extensions && chmod +x /usr/local/bin/install-php-extensions

# Installing extensions
RUN install-php-extensions \
	pdo_mysql \
	intl \
	mbstring \
	zip \
	exif \
	pcntl \
	bcmath \
	opcache \
	gd \
	imagick \
	apcu \
	@composer

# Installing other extensions but enabled dynamically
RUN REDIS_DONT_ENABLE=0 install-php-extensions redis
RUN MONGODB_DONT_ENABLE=0 install-php-extensions mongodb
RUN XDEBUG_DONT_ENABLE=0 install-php-extensions xdebug

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