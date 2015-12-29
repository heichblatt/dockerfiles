from fedora:23
maintainer heichblatt

run yum install -y make \
    git \
    dh-autoreconf \
    ncursesw-devel \
    jsoncpp-devel \
    libcurl-devel && \
    yum clean all
workdir /usr/src
run git clone https://github.com/Jarkore/Feednix.git
workdir Feednix
run ./configure
run make
run make install
