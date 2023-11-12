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

# Copy desktop files.
sudo --shell --user nathan -- <<EOF
	cp /opt/desktop/vscode.desktop ~/.local/share/applications/vscode.desktop
EOF

# Disable init service.
systemctl disable init
