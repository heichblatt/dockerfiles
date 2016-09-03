FROM heichblatt/archlinux-yaourt
MAINTAINER heichblatt

ENV SHA256SUM 8b68078f8414d7cbb2c407456012a4f1f9100f74dbb77f2b22504ec7af677505
USER root

RUN cd /tmp/ && \
    /usr/bin/curl -O https://raw.githubusercontent.com/BlackArch/blackarch-site/master/strap.sh && \
    echo ${SHA256SUM}" strap.sh" | sha256sum -c - && \
    /usr/bin/chmod +x ./strap.sh && \
    ./strap.sh && \
    /usr/bin/rm -v /tmp/strap.sh && \
    /usr/bin/pacman -Scc --noconfirm
USER user

CMD ["/usr/bin/bash"]
