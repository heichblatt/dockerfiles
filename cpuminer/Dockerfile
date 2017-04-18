FROM centos:latest
MAINTAINER heichblatt

ENV LC_ALL en_US.UTF-8
RUN /usr/bin/yum install -y git automake gcc make curl-devel jansson-devel && \
    /usr/bin/yum clean all
WORKDIR /usr/src
RUN git clone https://github.com/pooler/cpuminer
WORKDIR cpuminer
RUN ./autogen.sh
RUN ./configure CFLAGS="-O3"
RUN make
RUN make install
ENTRYPOINT ["/usr/local/bin/minerd"]
