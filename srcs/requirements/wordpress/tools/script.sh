#!/bin/bash

STR=$DB_ADMIN_WPUSER
SUB='admin'
URL="iziane.42.fr"
if [[ "$STR" == *"$SUB"* ]]; then
	echo "The administrators username must not contain admin, Admin,
		administrator, or Administrator (e.g., admin, administrator,
		Administrator, admin-123, etc.)"
	exit 1
fi

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_DATABASE \
							--dbuser=$DB_WPUSER \
							--dbpass=$DB_WPPASS \
							--dbhost=mariadb \
							--allow-root
./wp-cli.phar core install --url=$URL\
							--title=inception \
							--admin_user=$DB_ADMIN_WPUSER \
							--admin_password=$DB_ADMIN_WPPASS \
							--admin_email=$DB_ADMIN_EMAIL \
							--allow-root

./wp-cli.phar user create $DB_SECOND_WPUSER $DB_SECOND_EMAIL \
						--user_pass=$DB_SECOND_WPPASS \
						--role=$DB_SECOND_ROLE \
						--allow-root

php-fpm7.4 -F
