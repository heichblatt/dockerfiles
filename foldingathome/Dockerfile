FROM ubuntu:latest
LABEL maintainer="heichblatt"


ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb /tmp/fahclient.deb

# FIXME: Awful workaround until the DEBs are correctly packaged
RUN dpkg -i /tmp/fahclient.deb || true

VOLUME ["/var/lib/fahclient", "/etc/fahclient"]
ENTRYPOINT [ "/usr/bin/FAHClient" ]
CMD [ "--fold-anon" ]
