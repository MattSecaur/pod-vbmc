#!/bin/bash
NAME=pod-vbmc
podman stop ${NAME}
podman rm ${NAME}
podman rmi ${NAME}
