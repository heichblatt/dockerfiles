# torify on BlackArch

This image allows you to use the BlackArch tools torified. It is only a proof of concept, do not rely on it for strong anonymity!

Upon start, the container will start a Tor client and wait for it to bootstrap. After that, anything you specified as the `CMD` will be run under `torify`. The following command will install `sslyze` and check `www.example.com`'s TLS config with all traffic tunneled over Tor.

    docker run heichblatt/blackarch-torify "yaourt -S --noconfirm sslyze && sslyze --regular www.example.com"
