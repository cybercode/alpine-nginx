FROM alpine:latest

ENV NGINX_VERSION=1.14.2 

RUN apk --update add g++ git libxml2-dev libxslt-dev wget make perl-dev \
    && mkdir Projetos \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/src \
    && rm -rf /var/cache/apk/*

WORKDIR /tmp

RUN wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz && tar -zxf pcre-8.42.tar.gz \
    && cd pcre-8.42 && ./configure \
    && make install \
    && cd .. \
    && wget http://zlib.net/zlib-1.2.11.tar.gz && tar -zxf zlib-1.2.11.tar.gz \
    && cd zlib-1.2.11 && ./configure \
    && make install \
    && cd .. \
    && wget http://www.openssl.org/source/openssl-1.0.2o.tar.gz && tar -zxf openssl-1.0.2o.tar.gz \
    && git clone https://github.com/jcu-eresearch/nginx-custom-build.git \    
    && wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && tar zxf nginx-$NGINX_VERSION.tar.gz \
    && cd nginx-$NGINX_VERSION \
    && patch -p1 < ../nginx-custom-build/nginx-xslt-html-parser.patch \
    && ./configure \
        --error-log-path=/dev/stderr \
        --http-log-path=/dev/stdout \
        --with-pcre \
        --with-http_xslt_module \
        --with-http_ssl_module  \
        --with-openssl=../openssl-1.0.2o/ \  
        --with-http_perl_module \   
        && make \
        && make install \
        && cd .. && rm -rf /tmp/* \
        && apk del git wget make 

WORKDIR /Projetos/

ENV PATH /usr/local/nginx/sbin/:$PATH

EXPOSE 80 443