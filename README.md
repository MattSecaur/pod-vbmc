podman exec -ti \
	pod-vbmc vbmc add \
	--username admin --password password --port 6231 \
	--address 192.168.122.1 \
	--libvirt-uri qemu:///system  overcloud-ceph-0

podman exec -ti pod-vbmc vbmc start overcloud-ceph-0

podman exec -ti pod-vbmc vbmc list

podman ps -q --filter name=pod-vbmc
