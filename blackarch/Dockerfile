FROM base/archlinux
MAINTAINER heichblatt

ENV SRC_DIR=/usr/src/blackarch-keyring
ENV KEY_ID="66E0CDBD1E01F333"

RUN echo "keyserver-options auto-key-retrieve" >> /etc/pacman.d/gnupg/gpg.conf
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN /usr/bin/pacman -Sy --noconfirm archlinux-keyring
RUN /usr/bin/pacman -Su --noconfirm
RUN /usr/bin/pacman-db-upgrade
RUN /usr/bin/pacman -S --noconfirm ca-certificates ca-certificates-mozilla
RUN /usr/bin/pacman -S --noconfirm base-devel git sudo

RUN /usr/sbin/groupadd --system sudo && \
/usr/sbin/useradd -m --groups sudo user
RUN /usr/sbin/echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN /usr/bin/mkdir -pv ${SRC_DIR}
RUN /usr/bin/chown -Rv user: ${SRC_DIR}
RUN /usr/bin/pacman-key --recv-keys ${KEY_ID}
RUN /usr/bin/pacman-key --lsign-key ${KEY_ID}
USER user
RUN /usr/bin/gpg --always-trust --recv-keys ${KEY_ID}

WORKDIR ${SRC_DIR}
RUN /usr/bin/curl -O https://raw.githubusercontent.com/BlackArch/blackarch/master/packages/blackarch-keyring/PKGBUILD
RUN /usr/bin/curl -O https://raw.githubusercontent.com/BlackArch/blackarch/master/packages/blackarch-keyring/blackarch-keyring.install

RUN /usr/bin/makepkg