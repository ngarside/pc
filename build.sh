podman build --file containerfile --format docker --progress plain --security-opt label=disable --tag ghcr.io/ngarside/pc:latest .
