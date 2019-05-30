FROM debian:stable
LABEL maintainer="heichblatt"


RUN apt-get update \
    && apt-get install -y \
      python3-pip \
      sudo \
    && apt-get clean
RUN pip3 install \
    jupyter \
    bash_kernel
RUN python3 -m bash_kernel.install
RUN useradd -m --shell /bin/bash user
RUN echo "user ALL=NOPASSWD: ALL" > /etc/sudoers.d/user
USER user
WORKDIR /home/user
VOLUME /home/user

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888"]