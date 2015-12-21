FROM centos:7
MAINTAINER heichblatt
RUN yum install -y https://rpm.nodesource.com/pub_4.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm \
      http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y nodejs git httpd make gcc-c++ yum-utils && \
    yum-config-manager --enable remi-safe && \
    yum-config-manager --enable remi-php56 && \
    yum install -y php56 composer php56-php-pdo && \
    yum clean all
WORKDIR /usr/src
RUN git clone https://github.com/phanan/koel.git
WORKDIR koel
RUN npm install
RUN composer install
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
