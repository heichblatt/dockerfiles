FROM heichblatt/archlinux-yaourt
MAINTAINER heichblatt

ENV SHA256SUM 1ef8e5471d1ba7b4be31e5e81abab14cd4c89c1f31f3a8df9a313b7d1fa88971
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
