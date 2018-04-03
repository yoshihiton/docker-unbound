FROM alpine

RUN apk --update add \
    openrc \
    unbound \
    tzdata \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && echo "Asia/Tokyo" > /etc/timezone \
 && apk del tzdata \
 && rm -rf /var/cache/apk/* \
 && rc-update add unbound default \
 && sed -i 's/\tneed net/#\tneed net/' /etc/init.d/unbound \
 && sed -i 's/^tty/#tty/' /etc/inittab

CMD ["/sbin/init"]
