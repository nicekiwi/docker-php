FROM php:8-fpm-alpine3.14

# Setup ARG defaults
ARG WORKDIR=/srv/app
ARG TZ=UTC

ENV WORKDIR=${WORKDIR}
ENV TZ=${TZ}

# Setup Timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Install deps
RUN apk --update add bash autoconf build-base wget curl git zip unzip jpeg-dev zlib-dev libpng-dev shadow libpq postgresql-dev

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql exif pcntl bcmath gd

# Install PECL extensions
RUN pecl install redis \
    && docker-php-ext-enable redis

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set Working Dir
WORKDIR ${WORKDIR}

