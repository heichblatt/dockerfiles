FROM heichblatt/blackarch

RUN /usr/bin/yaourt -Sy --noconfirm tor torsocks tmux && \
    /usr/bin/yaourt -Scc --noconfirm
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
