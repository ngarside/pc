FROM quay.io/fedora/fedora-kinoite:42

RUN rpm-ostree install papirus-icon-theme

RUN rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-42.noarch.rpm

# RUN rpm-ostree install rpmfusion-nonfree-release-tainted

RUN rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia

RUN echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod

# $(uname -r)
RUN akmods --force --kernels $(rpm -qa kernel | grep -oP '(?<=kernel-).*') --rebuild

RUN tree /var/cache

RUN rpm-ostree install /var/cache/akmods/nvidia/kmod-nvidia-$(rpm -qa kernel | grep -oP '(?<=kernel-).*')-575.64.05-2.fc42.x86_64.rpm

# RUN rpm-ostree kargs --append=rd.driver.blacklist=nouveau,nova_core --append=modprobe.blacklist=nouveau,nova_core --append=nvidia-drm.modeset=1

RUN rpm-ostree cleanup --repomd

RUN ostree container commit
