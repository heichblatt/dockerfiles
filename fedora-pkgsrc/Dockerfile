FROM fedora:latest
LABEL maintainer="heichblatt"


RUN /bin/dnf install -y deltarpm tar && \
    /bin/dnf groupinstall -y  "Development Tools" && \
    /bin/dnf install -y curl gcc-c++ tar && \
    /bin/dnf clean all
RUN /bin/curl -O http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc.tar.gz && \
    /bin/tar xvzf pkgsrc.tar.gz -C /usr && \
    /bin/rm -v pkgsrc.tar.gz
WORKDIR /usr/pkgsrc/bootstrap
RUN ./bootstrap
RUN echo PATH=\$PATH:/usr/pkg/bin >> ~/.bashrc
RUN /usr/pkg/sbin/pkg_admin -K /usr/pkg/pkgdb fetch-pkg-vulnerabilities

ENTRYPOINT ["/usr/bin/bash"]
