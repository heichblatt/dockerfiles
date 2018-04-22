FROM heichblatt/archlinux-yaourt

RUN yaourt -Syy --noconfirm kitematic gtk2 gconf nss alsa-lib libxtst ttf-liberation xorg-fonts-misc && \
  yaourt -Rncs --noconfirm grunt-cli && \
  yaourt -Scc --noconfirm

CMD ["kitematic"]
