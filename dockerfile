FROM composer as composer

FROM php:7.4-cli

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update -y && apt-get upgrade  -y&& apt-get install git -y \ 
    && apt-get install p7zip-full  -y && apt-get install sqlite3 -y

RUN apt-get -y update \
    && apt-get install -y libicu-dev\
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN composer create-project laminas-api-tools/api-tools-skeleton

EXPOSE 8080