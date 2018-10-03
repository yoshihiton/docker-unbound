FROM alpine

RUN apk --update add \
        unbound \
        tzdata; \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime; \
    echo "Asia/Tokyo" > /etc/timezone; \
    apk del tzdata; \
    rm -rf /var/cache/apk/*; \
    mkdir /etc/unbound/conf.d

COPY unbound.conf /etc/unbound/

EXPOSE 53/udp

CMD ["/usr/sbin/unbound", "-d"]
