# [Kitematic](https://aur.archlinux.org/packages/kitematic/) on Arch Linux

Just a small experiment.

    docker build -t fedora-pkgsrc .
    docker run -ti -d -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/run/docker.sock:/var/run/docker.sock -e DISPLAY=unix$DISPLAY --name kitematic local/kitematic
    docker stop kitematic