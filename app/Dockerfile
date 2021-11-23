FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install mysql-server  apache2 php libapache2-mod-php php-mysql php-curl php-xml php-memcached systemctl -y
COPY . /var/www/html/app/

WORKDIR /var/www/html/app/

EXPOSE 80

CMD ["./startup.sh"]