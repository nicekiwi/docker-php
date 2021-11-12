FROM php:8.1.0RC4-fpm-alpine3.14

# Setup ARG defaults
ARG ENVIROMENT=production
ARG WORKDIR=/srv/app
ARG USER=root
ARG UID=1000
ARG TZ=UTC

ENV ENVIROMENT=${ENVIROMENT}
ENV WORKDIR=${WORKDIR}
ENV USER=${USER}
ENV UID=${UID}
ENV TZ=${TZ}

# Setup Timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Install deps
RUN apk --update add bash autoconf build-base wget curl git zip unzip jpeg-dev zlib-dev libpng-dev shadow libpq postgresql-dev

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql exif pcntl bcmath gd

# Install PECL extensions
RUN pecl install redis-5.3.2 \
    && docker-php-ext-enable redis

# Install XDebug
RUN if [[ "${ENVIROMENT}" != "production" ]] ; then \
        pecl install xdebug-3.0.2 \
        && docker-php-ext-enable xdebug ; \
    fi

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set default php.ini
RUN mv "${PHP_INI_DIR}/php.ini-${ENVIROMENT}" "${PHP_INI_DIR}/php.ini"

# Setup uID for user
RUN if [[ "${ENVIROMENT}" != "production" ] && [ "${USER}" != "root" ]] ; then \
        usermod -u ${UID} ${USER} ; \
    fi

# Setup User
USER ${USER}

# Set Working Dir
WORKDIR ${WORKDIR}

