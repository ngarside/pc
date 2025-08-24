# This is free and unencumbered software released into the public domain.

_default:
    just --list

# Build container image
build:
    podman build \
        --file containerfile \
        --format docker \
        --progress plain \
        --security-opt label=disable \
        --tag ghcr.io/ngarside/pc:latest \
        .
