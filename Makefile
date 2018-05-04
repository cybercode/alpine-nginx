.PHONY: build
ALPINE_VERSION := 3.7

.PHONY: build pull all

all: pull build

build:
	docker build -t cybercode/alpine-nginx --build-arg ALPINE_VERSION=${ALPINE_VERSION} .

pull:
	docker pull alpine:${ALPINE_VERSION}
