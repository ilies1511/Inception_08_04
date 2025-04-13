#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_DATABASE \
							--dbuser=$DB_WPUSER \
							--dbpass=$DB_WPPASS \
							--dbhost=mariadb \
							--allow-root
./wp-cli.phar core install --url=localhost \
							--title=inception \
							--admin_user=$DB_ADMIN_WPUSER \
							--admin_password=$DB_ADMIN_WPPASS \
							--admin_email=admin@admin.com \
							--allow-root

php-fpm7.4 -F
