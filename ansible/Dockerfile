from centos:7
maintainer heichblatt

run yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y ansible sudo python-dnf && \
    yum clean all
entrypoint ["/usr/bin/ansible-playbook","-i \"localhost,\""]
