# docker-php

## PHP 8 Docker Image

Optimised for Laravel 8.

- Alpine 3.14
- PHP 8.0.9
- Composer 2
- XDebug 3

Supports Redis and PostgreSQL.

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

XDebug is only installed when build with `ENVIROMENT="development"` and is disabled by default.

Enable with:

```
# php.ini

[xdebug]
xdebug.mode=debug
xdebug.client_host=host.docker.internal
xdebug.client_port="9003"
```

https://github.com/nicekiwi/docker-php
