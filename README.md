To install on a RHEL8/CentOS8 KVM hypervisor:

dnf install -y git podman ipmitool

git clone https://github.com/MattSecaur/pod-vbmc.git

cd pod-vbmc

./build.sh

./run.sh

podman exec -ti \
	pod-vbmc vbmc add \
	--username admin --password password --port 6231 \
	--address 192.168.122.1 \
	--libvirt-uri qemu:///system  overcloud-ceph-0

podman exec -ti pod-vbmc vbmc start overcloud-ceph-0

podman exec -ti pod-vbmc vbmc list

ipmitool -I lanplus -U admin -P password -H 192.168.122.1 -p 6231 power on

podman ps -q --filter name=pod-vbmc
