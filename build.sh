#!/bin/bash

docker buildx create --name phpbuilder --use 

# Build PHP 8
PHP_VERSION=8.0 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0 \
    --file Dockerfile \
    .

PHP_VERSION=8.0.25 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0.25 \
    --file Dockerfile \
    .

PHP_VERSION=8.0.26 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0.26 \
    --file Dockerfile \
    .

# Build PHP 8.1
PHP_VERSION=8.1 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.1 \
    --file Dockerfile \
    .

PHP_VERSION=8.1.15 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.1.15 \
    --file Dockerfile \
    .

# Build PHP 8.2
PHP_VERSION=8.2 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.2 \
    --file Dockerfile \
    .

PHP_VERSION=8.2.2 docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.2.2 \
    --file Dockerfile \
    .

