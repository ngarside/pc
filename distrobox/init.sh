#!/bin/bash
# This is free and unencumbered software released into the public domain.

# Change directory ownership.
# Cannot be done in containerfile as user/group is not known at build time.
chown --recursive nathan:nathan /opt/code

# Install non-free packages.
zypper --non-interactive install code

# Install VS code extensions.
sudo --shell --user nathan -- <<EOF
	code --extensions-dir /opt/code/extensions --install-extension EditorConfig.EditorConfig --user-data-dir /opt/code/data
	code --extensions-dir /opt/code/extensions --install-extension GitHub.github-vscode-theme --user-data-dir /opt/code/data
	code --extensions-dir /opt/code/extensions --install-extension PKief.material-icon-theme --user-data-dir /opt/code/data
EOF

# Install JetBrains PyCharm
pycharm=$(wget -qO- https://data.services.jetbrains.com/products/releases?code=PCP | jq --raw-output .PCP[0].downloads.linux.link)
mkdir /opt/pycharm
wget -O- $pycharm | tar --directory /opt/pycharm --extract --gzip --strip-components 1

# Install JetBrains Rider
rider=$(wget -qO- https://data.services.jetbrains.com/products/releases?code=RD | jq --raw-output .RD[0].downloads.linux.link)
mkdir /opt/rider
wget -O- $rider | tar --directory /opt/rider --extract --gzip --strip-components 1

# Copy desktop files.
sudo --shell --user nathan -- <<EOF
	cp /opt/desktop/pycharm.desktop ~/.local/share/applications/pycharm.desktop
	cp /opt/desktop/rider.desktop ~/.local/share/applications/rider.desktop
	cp /opt/desktop/vscode.desktop ~/.local/share/applications/vscode.desktop
EOF

# Disable init service.
systemctl disable init
