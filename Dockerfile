FROM killtw/elasticsearch-rtf:5.1.1

MAINTAINER Karl Li <killtw@gmail.com>

ENV ES_USER=elastic \
    ES_PASS=password

ADD nginx.conf /etc/nginx/nginx.conf

RUN apk -U add nginx apache2-utils && \
    chown -R nginx:www-data /var/lib/nginx && \
    mkdir -p /etc/nginx/passwd && \
    rm -rf /var/cache/apk/*

EXPOSE 9200 9300

VOLUME ["/data", "/conf"]

WORKDIR $ES_HOME

COPY start /

CMD ["/start"]
