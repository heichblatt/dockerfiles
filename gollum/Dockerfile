FROM centos:7
MAINTAINER heichblatt

RUN /usr/bin/yum install -y deltarpm && \
    /usr/bin/yum group install -y "Development Tools" && \
    /usr/bin/yum install -y yum install ruby ruby-devel libicu \
      libicu-devel zlib zlib-devel which && \
    /usr/bin/yum clean all
RUN /usr/bin/gem install --no-ri --no-rdoc redcarpet RedCloth
RUN /usr/bin/gem install --no-ri --no-rdoc --verbose gollum
RUN /usr/sbin/groupadd --gid 1000 gollum
RUN /usr/sbin/adduser --uid 1000 --gid 1000 --home /repo gollum
WORKDIR /repo
USER gollum
EXPOSE 4567
CMD ["/usr/local/bin/gollum"]
