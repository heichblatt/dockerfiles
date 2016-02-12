FROM centos:7
MAINTAINER heichblatt

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y rubygems ruby-devel gcc make nodejs && \
    gem install --verbose --no-rdoc --no-ri jekyll pygments.rb && \
    gem install RedCloth --version 4.2.2 && \
    yum remove -y gcc make ruby-devel && \
    yum clean all

VOLUME ["/target"]
WORKDIR /target
EXPOSE 4000
CMD ["serve", "--host=0.0.0.0"]
ENTRYPOINT ["/usr/local/bin/jekyll"]
