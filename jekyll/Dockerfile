FROM alpine:latest
LABEL maintainer="heichblatt"


ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Heavily influenced by
# https://github.com/inadarei/alpine-jekyll/blob/master/Dockerfile
RUN apk update && \
    apk add libatomic readline readline-dev libxml2 libxml2-dev \
        ncurses-terminfo-base ncurses-terminfo \
        libxslt libxslt-dev zlib-dev zlib \
        ruby ruby-dev yaml yaml-dev \
        libffi-dev build-base git nodejs ruby-bundler \
        ruby-io-console ruby-irb ruby-json ruby-rake ruby-bigdecimal ruby-ffi && \
    gem install --no-ri --no-rdoc jekyll && \
    apk del zlib-dev readline-dev \
        yaml-dev libffi-dev libxml2-dev && \
    rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/*

VOLUME ["/target"]
WORKDIR /target
EXPOSE 4000
CMD ["serve", "--host=0.0.0.0"]
ENTRYPOINT ["jekyll"]
