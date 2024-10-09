FROM docker.elastic.co/beats/packetbeat:8.15.1

USER root
# Install net-tools
RUN apt-get update && apt-get install -y net-tools && rm -rf /var/lib/apt/lists/*
USER packetbeat