# This is free and unencumbered software released into the public domain.

# Install non-free packages
sudo zypper --non-interactive install code

# Fallback to default entrypoint
/bin/bash -c "$@"
