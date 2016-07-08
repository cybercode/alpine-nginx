# Alpine Nginx

This is a `Dockerfile` to build an nginx container `FROM` [Alpine 3.4](https://hub.docker.com/_/alpine/).

The configuration is almost identical the the [official Nginx container](https://hub.docker.com/_/nginx/), with the exception of the following changes:

## Confguration options modifications

- --error-log-path=stderr
- --http-log-path=/dev/stdout

## Removed configuration options

- --with-http_dav_module
- --with-http_flv_module
- --with-http_mp4_module
- --with-http_random_index_module
- --with-http_secure_link_module
- --with-mail
- --with-mail_ssl_module
- --with-file-aio (unsupported on Alpine Linux)

## Added configuration options

- --with-pcre-jit
- --without-http_memcached_module
- --without-mail_pop3_module
- --without-mail_imap_module
- --without-mail_smtp_module

