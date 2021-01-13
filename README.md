# docker-php

PHP 8 Docker Image

- Alpine Base
- PHP 8
- Composer 2
- XDebug 3

Runs as `1000:www-data`

`WORKDIR` optimised for CaddyServer app at `/srv/app/`.

### Build ENVs

```
ENVIRONMENT=production
TZ=UTC
UID=1000
```

`ENVIRONMENT` defines weather `development` or `production` php.ini template is used.

XDebug is installed, but not enabled in php.ini by default.
