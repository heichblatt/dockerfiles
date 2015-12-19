FROM oraclelinux:7
MAINTAINER heichblatt

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all
RUN yum install -y openssh-server \
      java-1.7.0-openjdk \
      git \
      wget \
      pv && \
    yum clean all
RUN yum group install -y "Development Tools" && \
    yum clean all
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -pv /var/run/sshd /jenkins

RUN adduser jenkins
RUN echo "jenkins:jenkins" | chpasswd

EXPOSE 22
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
