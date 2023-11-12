#!/bin/bash
# This is free and unencumbered software released into the public domain.

# Change directoy ownership.
# Cannot be done in containerfile as user/group is not known at build time.
chown --recursive nathan:nathan /opt/code

# Install non-free packages.
zypper --non-interactive install code
