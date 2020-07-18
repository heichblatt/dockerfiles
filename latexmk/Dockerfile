FROM fedora:latest
LABEL maintainer="heichblatt"


RUN /bin/dnf install -y texlive \
      texlive-amsfonts \
      texlive-babel-german \
      texlive-latex \
      texlive-base \
      texlive-metafont-bin \
      texlive-texconfig \
      texlive-preprint \
      texlive-dinbrief \
      texlive-wrapfig \
      texlive-gfsbodoni \
      texlive-gfsdidot \
      texlive-greek-fontenc \
      texlive-babel-greek \
      texlive-cbfonts \
      texlive-cbfonts-fd \
      latexmk && \
    /bin/dnf clean all
RUN /bin/mkdir -pv /target
WORKDIR /target
ADD ./entrypoint.sh /usr/bin/local/entrypoint.sh
ENTRYPOINT ["/usr/bin/local/entrypoint.sh"]
