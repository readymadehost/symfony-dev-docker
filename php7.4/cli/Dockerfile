FROM php:7.4-cli

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
RUN apt-get install --no-install-recommends -y mariadb-client

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION}

# Installing node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash -
RUN apt-get -y install nodejs

# Installing yarn using npm
RUN npm install --global yarn

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
RUN IPE_DONT_ENABLE=1 install-php-extensions redis \
	mongodb \
	xdebug

# Updating php.ini
ADD conf/php.ini /usr/local/etc/php/php.ini

# Installing symfony cli
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN echo 'export PATH="$HOME/.symfony/bin:$PATH"' >> ~/.bashrc

# Manage project and add scripts
RUN mkdir -p /var/www/project
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