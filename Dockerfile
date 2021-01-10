FROM php:8.0-fpm-alpine

# Setup ENV defaults
ENV ENVIROMENT=development
ENV UID=1000
ENV TZ=UTC

# Setup Timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install deps
RUN apk --update add bash autoconf build-base wget curl git zip unzip jpeg-dev zlib-dev libpng-dev shadow

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql exif pcntl bcmath gd

# Install PECL extensions
RUN pecl install redis-5.3.2 \
    && pecl install xdebug-3.0.2 \
    && docker-php-ext-enable redis xdebug

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set default dev php.ini
RUN mv "$PHP_INI_DIR/php.ini-$ENVIROMENT" "$PHP_INI_DIR/php.ini"

# Setup uID for active user
RUN usermod -u $UID www-data

# Set Working Dir
WORKDIR /srv/app

CMD ["php-fpm"]
