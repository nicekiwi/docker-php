ARG PHP_VERSION=8.2.2
ARG ALPINE_VERSION=3.17

FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION}

# Setup ARG defaults
ARG WORKDIR=/var/www/html
ARG TZ=UTC

ENV WORKDIR=${WORKDIR}
ENV TZ=${TZ}

# Setup Timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Install deps
RUN apk --update add bash autoconf build-base wget curl git zip unzip jpeg-dev zlib-dev libpng-dev shadow libpq postgresql-dev

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql exif pcntl bcmath gd mysqli

# Install PECL extensions
RUN pecl install redis \
    && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set Working Dir
WORKDIR ${WORKDIR}
