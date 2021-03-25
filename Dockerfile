FROM python:3.6
LABEL description="virtual BMC" version="1.6"
MAINTAINER msecaur@redhat.com

ENV DEBIAN_FRONTEND noninteractive
ENV container docker

RUN apt-get update --fix-missing

# Setup
USER root

# Packages
RUN apt-get install -y libvirt-dev ipmitool python python-setuptools python-six python-cryptography libvirt0
RUN apt-get install -y python-pip pkg-config libvirt-dev
RUN apt-get clean
RUN pip install virtualbmc

RUN rm -Rf /var/lib/apt/lists/*
RUN rm -Rf /var/cache/apt/archives/*.deb
RUN rm -Rf /var/cache/apt/archives/partial/*

ENV PATH="/usr/local/bin:${PATH}"

COPY vbmc.sh /usr/local/bin/vbmc.sh
RUN chmod +x /usr/local/bin/vbmc.sh

ENTRYPOINT ["/usr/local/bin/vbmc.sh"]

# Set a default command useful for debugging
#CMD ["/bin/bash", "--login"]
