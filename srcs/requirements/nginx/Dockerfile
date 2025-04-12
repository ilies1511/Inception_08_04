FROM debian:bullseye

RUN apt-get update && apt-get install nginx -y

COPY conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
