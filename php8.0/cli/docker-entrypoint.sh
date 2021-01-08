#!/bin/bash

/root/manage-project-permission.sh

if [ ${PHP_ENABLE_REDIS} -eq "1" ]; then
    docker-php-ext-enable redis
    echo "-- php cli redis extension enabled"
fi

if [ ${PHP_ENABLE_XDEBUG} -eq "1" ]; then
    docker-php-ext-enable xdebug
    echo "-- php cli xdebug extension enabled"
fi

if [ ${PHP_ENABLE_MONGODB} -eq "1" ]; then
    docker-php-ext-enable mongodb
    echo "-- php cli mongodb extension enabled"
fi

tail -f /dev/null
