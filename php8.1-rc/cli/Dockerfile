FROM php:8.1-rc-cli

LABEL maintainer="ReadyMadeHost http://readymadehost.com"

# Installing required packages
RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-transport-https \
	libicu-dev \
	libfreetype6-dev \
	libjpeg-dev \
	libpng-dev \
    libonig-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    git \
    vim \
    zip \
    unzip \
    wget \
    screenfetch \
    mariadb-client

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg

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

# RUN pecl install apcu
# RUN docker-php-ext-enable apcu

# Installing other extensions but enabled dynamically
RUN pecl install redis
# RUN docker-php-ext-enable redis
# RUN pecl install xdebug
RUN pecl install xdebug-3.1.0beta2
# RUN docker-php-ext-enable xdebug
# RUN pecl install mongodb
RUN pecl install mongodb-1.11.0alpha1
# RUN docker-php-ext-enable mongodb

# Updating php.ini
ADD conf/php.ini /usr/local/etc/php/php.ini

# Installing composer
VOLUME /root/.composer/cache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installing symfony cli
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN echo 'export PATH="$HOME/.symfony/bin:$PATH"' >> ~/.bashrc

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION}

# Installing node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash -
RUN apt-get -y install nodejs

# Installing yarn using npm
RUN npm install --global yarn

# Manage project and add scripts
RUN mkdir /var/www/project
ADD manage-project-permission.sh /root/manage-project-permission.sh
RUN chmod +x /root/manage-project-permission.sh
RUN echo 'alias mpp="/root/manage-project-permission.sh"' >> /root/.bashrc
RUN /root/manage-project-permission.sh

ARG PHP_ENABLE_REDIS
ENV PHP_ENABLE_REDIS ${PHP_ENABLE_REDIS}
ARG PHP_ENABLE_XDEBUG
ENV PHP_ENABLE_XDEBUG ${PHP_ENABLE_XDEBUG}
ARG PHP_ENABLE_MONGODB
ENV PHP_ENABLE_MONGODB ${PHP_ENABLE_MONGODB}

ADD docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

CMD ["/root/docker-entrypoint.sh", "bash"]