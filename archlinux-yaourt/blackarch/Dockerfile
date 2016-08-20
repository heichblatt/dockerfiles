FROM heichblatt/archlinux-yaourt
MAINTAINER heichblatt

ENV SHA256SUM 4b1d939659e26ddc4bc1588a57e20da9be5cc6d80ae0507b19f41ef44725fced
USER root

RUN cd /tmp/ && \
    /usr/bin/curl -O https://raw.githubusercontent.com/BlackArch/blackarch-site/master/strap.sh && \
    echo ${SHA256SUM}" strap.sh" | sha256sum -c - && \
    /usr/bin/chmod +x ./strap.sh && \
    ./strap.sh && \
    /usr/bin/rm -v /tmp/strap.sh && \
    /usr/bin/pacman -Scc --noconfirm
USER user
