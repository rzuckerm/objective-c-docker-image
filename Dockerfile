FROM ubuntu:22.04

COPY OBJECTIVE-C_* /tmp/
ENV DEBIAN_FRONTEND=non-interactive
RUN apt-get update && \
    apt-get install -y gobjc gnustep-devel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
