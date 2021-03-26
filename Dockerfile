FROM centos:8
LABEL description="virtual BMC" version="1.6"
MAINTAINER msecaur@redhat.com

RUN dnf -y update

# Setup
USER root

# Packages
RUN yum install -y python3-pip python3-libvirt && dnf clean all
RUN pip3 install -U pip setuptools
RUN pip3 install virtualbmc

ENV PATH="/usr/local/bin:${PATH}"

COPY vbmc.sh /usr/local/bin/vbmc.sh
RUN chmod +x /usr/local/bin/vbmc.sh

ENTRYPOINT ["/usr/local/bin/vbmc.sh"]

# Set a default command useful for debugging
#CMD ["/bin/bash", "--login"]
