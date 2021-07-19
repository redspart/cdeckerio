#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# Note: You can use any Debian/Ubuntu based image you want. 
FROM debian:9

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Docker Compose version
ARG COMPOSE_VERSION=1.24.0

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV HUGO_VERSION 0.85.0
#ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
#hugo_0.85.0_Linux-ARM64.deb
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-ARM64.deb
#ENV HUGO_BINARY hu

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools installed
    && apt-get -y install git procps \
    #
    # Web tools
    && apt-get -y install vim fish libstdc++6 python-pygments git ca-certificates asciidoc curl \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
