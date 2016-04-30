FROM base/archlinux
MAINTAINER heichblatt

# Update, install yaourt and base-devel (incl. sudo), allow sudo for %users
RUN /usr/sbin/pacman-key --refresh-keys && \
    /usr/sbin/pacman -Syu --noconfirm && \
    /usr/sbin/pacman-db-upgrade && \
    /usr/sbin/pacman -Syy --noconfirm --needed base-devel perl && \
    /usr/sbin/pacman -Scc --noconfirm && \
    /usr/sbin/sudo /usr/sbin/ln -sv /usr/bin/core_perl/pod2man /usr/sbin && \
    /usr/sbin/sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
    /usr/sbin/echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add user, group sudo; switch to user
RUN /usr/sbin/groupadd --system sudo && \
    /usr/sbin/useradd -m --groups sudo user
USER user

# install pacaur
# adapted from https://gist.github.com/Tadly/0e65d30f279a34c33e9b
RUN /usr/bin/mkdir -pv /tmp/pacaur_install && \
    cd /tmp/pacaur_install && \
    /usr/sbin/sudo /usr/sbin/pacman -S --needed expac yajl git --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower" && \
    /usr/sbin/makepkg PKGBUILD --skippgpcheck && \
    /usr/sbin/sudo /usr/sbin/pacman -U cower*.tar.xz --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur" && \
    /usr/sbin/makepkg PKGBUILD && \
    /usr/sbin/sudo /usr/sbin/pacman -U pacaur*.tar.xz --noconfirm && \
    cd && \
    /usr/sbin/rm -rv /tmp/pacaur_install
