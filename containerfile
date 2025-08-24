FROM quay.io/fedora/fedora-kinoite:42

RUN rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-42.noarch.rpm

RUN rpm-ostree cleanup --repomd

RUN ostree container commit
