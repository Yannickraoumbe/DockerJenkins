docker container run --rm --name maria -v /Users/yannickmaelraoumbe/Documents/sources/DevOps/nginx-php-mariadb/create.sql:/docker-entrypoint-initdb.d/create.sql -p 3306:3306 --env MYSQL_ROOT_PASSWORD=azerty -d mariadb

docker container run --link maria --rm --name php -v /Users/yannickmaelraoumbe/Documents/sources/DevOps/nginx-php-mariadb/monsite:/var/www/monsite -d php:fpm-mysqli

docker container run --link php --rm --name web -v /Users/yannickmaelraoumbe/Documents/sources/DevOps/nginx-php-mariadb/monsite:/var/www/monsite -v /Users/yannickmaelraoumbe/Documents/sources/DevOps/nginx-php-mariadb/default.conf:/etc/nginx/conf.d/default.conf -p 8080:80 -d nginx
