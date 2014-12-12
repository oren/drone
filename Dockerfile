# https://registry.hub.docker.com/_/golang/
FROM golang:1.4

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

# Node
RUN curl -sL https://deb.nodesource.com/setup | bash -

# build-essential so we can run 'make'
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash developer
RUN chown -R developer:developer /go
USER developer

