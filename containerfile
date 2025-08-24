FROM quay.io/fedora/fedora-kinoite:42

RUN rpm-ostree install papirus-icon-theme

RUN rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-42.noarch.rpm

RUN rpm-ostree install akmod-nvidia-open xorg-x11-drv-nvidia

# RUN rpm-ostree kargs --append=rd.driver.blacklist=nouveau,nova_core --append=modprobe.blacklist=nouveau,nova_core --append=nvidia-drm.modeset=1

RUN rpm-ostree cleanup --repomd

RUN ostree container commit
