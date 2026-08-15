FROM docker.io/library/php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite headers

COPY . /var/www/html/

ENV APACHE_DOCUMENT_ROOT=/var/www/html

EXPOSE 80