#!/usr/bin/bash -e

CONFIG=.env

cp .env.example ${CONFIG}

echo Creating ${CONFIG}.

sed -i 's/DB_HOST=.*/DB_HOST='${MYSQL_HOST}'/g' ${CONFIG}
sed -i 's/DB_DATABASE=.*/DB_DATABASE='${MYSQL_DATABASE}'/g' ${CONFIG}
sed -i 's/DB_USERNAME=.*/DB_USERNAME='${MYSQL_USER}'/g' ${CONFIG}
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD='${MYSQL_PASSWORD}'/g' ${CONFIG}

sed -i 's/ADMIN_EMAIL=.*/ADMIN_EMAIL='${ADMIN_EMAIL}'/g' ${CONFIG}
sed -i 's/ADMIN_NAME=.*/ADMIN_NAME='${ADMIN_NAME}'/g' ${CONFIG}
sed -i 's/ADMIN_PASSWORD=.*/ADMIN_PASSWORD='${ADMIN_PASSWORD}'/g' ${CONFIG}


php artisan init
exec php partisan serve
