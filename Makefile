.PHONY: build
ALPINE_VERSION := 3.15
NGINX_VERSION := 1.20.2

.PHONY: build pull all

all: pull build

build:
	docker build -t cybercode/alpine-nginx \
		--build-arg ALPINE_VERSION=${ALPINE_VERSION} \
		--build-arg NGINX_VERSION=${NGINX_VERSION} \
		.

pull:
	docker pull alpine:${ALPINE_VERSION}
