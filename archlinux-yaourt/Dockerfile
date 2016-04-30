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

# install yaourt
RUN /usr/bin/mkdir -pv /tmp/yaourt_install && \
    cd /tmp/yaourt_install && \
    /usr/sbin/sudo /usr/sbin/pacman -S --needed yajl gettext diffutils git --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=package-query" && \
    /usr/sbin/makepkg PKGBUILD && \
    /usr/sbin/sudo /usr/sbin/pacman -U package-query*.tar.xz --noconfirm && \
    /usr/sbin/curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yaourt" && \
    /usr/sbin/makepkg PKGBUILD && \
    /usr/sbin/sudo /usr/sbin/pacman -U yaourt*pkg*.tar.xz --noconfirm && \
    cd && \
    /usr/sbin/rm -rv /tmp/yaourt_install
