#!/bin/sh
NAME=pod-vbmc
export PODMAN_ID="$(podman ps -aq --filter name=pod-vbmc)"
mkdir -p /root/.vbmc
mkdir -p /var/log/virtualbmc
touch /etc/virtualbmc

if [[ "${PODMAN_ID}" != "" ]]; then
	podman start ${NAME}
else
	podman run \
	-d --privileged \
	--restart=always \
	--network=host \
	-v /var/run/libvirt:/var/run/libvirt \
	-v /etc/virtualbmc:/etc/virtualbmc \
	-v /var/log/virtualbmc:/var/log/virtualbmc \
	-v /root/.vbmc:/root/.vbmc \
	--name ${NAME} \
	pod-vbmc:latest
fi

