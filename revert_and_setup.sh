#!/bin/sh

set -e

for vm in ffhl-gw01 ffhl-gw02; do
	echo "reverting $vm"

	virsh snapshot-revert --current --domain $vm
	ssh -q $vm systemctl restart systemd-timesyncd
done


echo "waiting..."
sleep 5

echo "removing artifacts"
rm -rf artifacts

echo "run the setup"
ansible-playbook -vvv -i hosts_new debian_setup.yml
