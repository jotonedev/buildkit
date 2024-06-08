FROM buildpack-deps:stable

RUN mkdir ~/.ssh && echo "StrictHostKeyChecking no" > ~/.ssh/config

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libudev-dev \
    openssh-client \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
