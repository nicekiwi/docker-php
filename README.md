# docker-php

## PHP 8 Docker Image

Optimised for Laravel

- Alpine 3.12
- PHP 8.0.6
- Composer 2
- XDebug 3

Supports Redis, PostgreSQL and MySQL.

## Build ENV variables

```
# Defaults
ENVIRONMENT=production
WORKDIR=/srv/app
USER=root
TZ=UTC

# Set if ENVIROMENT != production && USER != root
UID=1000
```

`ENVIRONMENT` defines weather `development` or `production` php.ini template is used.

## XDebug

XDebug is disabled by default.

Enable with:

```
# php.ini

[xdebug]
xdebug.mode=debug
xdebug.client_host=host.docker.internal
xdebug.client_port="9003"
```
