#!/usr/bin/env bash

# Setup machine to build amd64 and i386
sudo dpkg --add-architecture amd64

# Update list of packages
sudo apt update

# Install tools needed to build
sudo apt install -y \
    pkg-config \
    doxygen \
    clang \
    gcc-multilib \
    g++-multilib \
    python3 \
    git-lfs \
    nasm \
    g++-arm-linux-gnueabi \
    gcc-arm-linux-gnueabi \

# Install libraries needed to build
sudo apt install -y \
    libgl1-mesa-dev \
