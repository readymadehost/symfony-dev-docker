#!/bin/bash

echo "------------------------------------------"
echo "Running manage-project-permission.sh (mpp)"

PROJECT_ROOT="/var/www/project"

echo "- setting 777 to" ${PROJECT_ROOT}
chmod -R 777 ${PROJECT_ROOT}

echo "- setting www-data:www-data to" ${PROJECT_ROOT}
chown -R www-data:www-data ${PROJECT_ROOT}

echo "- setting g+s to" ${PROJECT_ROOT}
chmod -R g+s ${PROJECT_ROOT}
echo "------------------------------------------"
