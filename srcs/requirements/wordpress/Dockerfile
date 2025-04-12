FROM debian:bullseye

RUN apt-get update && apt-get install php-fpm curl php-mysqli -y

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/script.sh .

RUN mkdir /run/php && chmod +x script.sh

CMD ["./script.sh"]
