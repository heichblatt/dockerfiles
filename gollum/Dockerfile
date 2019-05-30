FROM alpine:latest
LABEL maintainer="heichblatt"


RUN apk update && \
    apk add ruby ruby-dev ruby-rake ruby-rdoc \
        libffi-dev build-base git zlib-dev icu-dev && \
    gem install --no-ri --no-rdoc gollum && \
    apk del build-base ruby-dev && \
    rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/*

WORKDIR /repo
EXPOSE 4567
CMD ["/usr/bin/gollum"]
