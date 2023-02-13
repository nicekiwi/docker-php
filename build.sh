#!/bin/bash
docker buildx create --name phpbuilder --use 

# Build PHP 8
docker buildx build \
    --build-arg PHP_VERSION=8.0 \
    --build-arg ALPINE_VERSION=3.16 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0 \
    --file Dockerfile \
    .

docker buildx build \
    --build-arg PHP_VERSION=8.0.25 \
    --build-arg ALPINE_VERSION=3.15 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0.25 \
    --file Dockerfile \
    .

docker buildx build \
    --build-arg PHP_VERSION=8.0.26 \
    --build-arg ALPINE_VERSION=3.16 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0.26 \
    --file Dockerfile \
    .

docker buildx build \
    --build-arg PHP_VERSION=8.0.27 \
    --build-arg ALPINE_VERSION=3.16 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.0.27 \
    --file Dockerfile \
    .

# Build PHP 8.1
docker buildx build \
    --build-arg PHP_VERSION=8.1 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.1 \
    --file Dockerfile \
    .

docker buildx build \
    --build-arg PHP_VERSION=8.1.15 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.1.15 \
    --file Dockerfile \
    .

# Build PHP 8.2
docker buildx build \
    --build-arg PHP_VERSION=8.2 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.2 \
    --file Dockerfile \
    .

docker buildx build \
    --build-arg PHP_VERSION=8.2.2 \
    --platform linux/amd64,linux/arm64 \
    --push \
    --tag nicekiwi/php:8.2.2 \
    --file Dockerfile \
    .

