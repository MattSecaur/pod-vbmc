#!/bin/sh

IMAGE_NAME=pod-vbmc
podman build --squash-all -t ${IMAGE_NAME} .
