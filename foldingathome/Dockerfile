FROM centos:7
MAINTAINER heichblatt

ENV RPM_URL https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.5/fahclient-7.5.1-1.x86_64.rpm

RUN /usr/bin/yum install -y ${RPM_URL} && \
    /usr/bin/yum clean all
VOLUME ["/var/lib/fahclient", "/etc/fahclient"]
ENTRYPOINT [ "/usr/bin/FAHClient" ]
CMD [ "--fold-anon" ]
