FROM debian:bullseye

RUN apt-get update && apt-get install nginx openssl -y

COPY conf/default /etc/nginx/sites-available/.
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/iziane.key -out /etc/ssl/certs/iziane.crt -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=TLIOT/UID=TTT'

CMD ["nginx", "-g", "daemon off;"]
