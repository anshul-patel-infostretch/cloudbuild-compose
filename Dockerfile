FROM debian:stretch


RUN apt-get -y update && apt-get -y --no-install-recommends install \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    gnupg2 \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" \
    && chmod +x /usr/local/bin/docker-compose


RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
    && apt-get -y update \
    &&  apt-get -y --no-install-recommends install docker-ce \
    && rm -rf /var/lib/apt/lists/*
