FROM debian:bullseye

RUN apt-get update && apt-get install -y php-fpm

RUN mkdir /run/php

CMD [ "php-fpm7.4", "-F" ]
