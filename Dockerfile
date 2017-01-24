FROM java:8u92-jre-alpine

MAINTAINER Karl Li <killtw@gmail.com>

ENV ES_HOME=/usr/share/elasticsearch-rtf \
    DEFAULT_ES_USER=elasticsearch \
    DISCOVER_TRANSPORT_IP=eth0 \
    DISCOVER_HTTP_IP=eth0 \
    ES_JAVA_OPTS="-Xms2024m -Xmx2024m" \
    PATH=/usr/share/elasticsearch-rtf/bin:$PATH

RUN apk -U add bash git && \
    cd /usr/share && \
    git clone git://github.com/medcl/elasticsearch-rtf.git -b master --depth 1 && \
    adduser -S -s /bin/sh $DEFAULT_ES_USER && \
    apk del git && \
    rm -rf /var/cache/apk/*

EXPOSE 9200 9300

VOLUME ["/data", "/conf"]

WORKDIR $ES_HOME

COPY start /

CMD ["/start"]
