# pkgsrc on latest Fedora

Just a small experiment.

    docker build -t fedora-pkgsrc .
    docker run -ti fedora-pkgsrc bash
    cd /usr/pkgsrc/shells/bash
    bmake install clean

In case some port refuses to build because of existing vulnerabilities, do the wrong thing and

    echo "ALLOW_VULNERABLE_PACKAGES=yes" >> /usr/pkg/etc/mk.conf
