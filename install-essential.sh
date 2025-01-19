#!/bin/bash

apt-get update --fix-missing && \
apt-get install -y --no-install-recommends \
    curl \
    git \
    jq \
    openssh-client \
    vim \
    wget 
