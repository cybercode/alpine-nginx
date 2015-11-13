# Alpine Nginx

This is a `Dockerfile` to build an nginx container `FROM` [Alpine edge](https://hub.docker.com/_/alpine/). The results of this change can be seen in the abbreviated `docker images` output below:

``` sh
REPOSITORY          TAG        IMAGE ID          VIRTUAL SIZE
cybercode/nginx     latest     7dd3f5d3ff61      15.25 MB
nginx               1.9.6      81415e35fc6c      132.7 MB
```

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

- --without-http_memcached_module
- --without-mail_pop3_module
- --without-mail_imap_module
- --without-mail_smtp_module

