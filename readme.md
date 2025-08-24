<!-- This is free and unencumbered software released into the public domain -->

# <p align=center>PC

The GitOps codebase for my home PC.

# <p align=center>Setup

```sh
sudo bootc switch ghcr.io/ngarside/pc:latest

sudo rpm-ostree kargs --append=rd.driver.blacklist=nouveau,nova_core --append=modprobe.blacklist=nouveau,nova_core --append=nvidia-drm.modeset=1

reboot
```

# <p align=center>License

This is free and unencumbered software released into the public domain.
