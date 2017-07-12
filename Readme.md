# Alpine Nginx

This is a `Dockerfile` to build an nginx container `FROM` [Alpine Linux](https://hub.docker.com/_/alpine/).

## Image build

By default, the `Makefile` will pull the latest Alpine version from dockerhub and build the image.

The Alpine version is specified in the `Dockerfile` via an `ARG` instruction, set to defaults in both the `Makefile` and `Dockerfile` (so both the pull and the automated dockerhub build work corectly.) The Nginx version is set via an `ENV` instruction. As of this writing, the version defaults are:

  - Alpine 3.6
  - Nginx 1.12.1

## Nginx configuration

The configuration is almost identical the the [official Nginx container](https://hub.docker.com/_/nginx/), with the exception of the following changes:

### Modified options

- --error-log-path=stderr
- --http-log-path=/dev/stdout

### Removed options

- --with-http_dav_module
- --with-http_flv_module
- --with-http_mp4_module
- --with-http_random_index_module
- --with-http_secure_link_module
- --with-mail
- --with-mail_ssl_module
- --with-file-aio (unsupported on Alpine Linux)

### Added options

- --with-pcre-jit
- --without-http_memcached_module
- --without-mail_pop3_module
- --without-mail_imap_module
- --without-mail_smtp_module
