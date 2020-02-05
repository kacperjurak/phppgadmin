FROM php:7.4.2-apache

LABEL maintainer="Kacper Jurak <kacper@jurak.pl>" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="Kacper Jurak" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/kacperjurak/phppgadmin" \
    org.label-schema.license="MIT"

ADD ./assets /var

RUN apt update && apt -y upgrade
RUN apt install -y libpq-dev unzip \
    && docker-php-ext-install pgsql \
    && /var/buildtime/install \
    && cp -ar /var/etc/* /etc \
    && rm -rf /var/cache/apk/* /var/etc /var/buildtime
