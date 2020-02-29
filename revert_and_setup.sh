#!/bin/sh

set -e

# virsh snapshot-revert --domain ffhl-test-gateway --current
virsh snapshot-revert --domain ffhl-gw01 --current
echo "restarting timesyncd and ntp"
ssh -q root@10.8.1.50 systemctl restart systemd-timesyncd
# ssh -q root@10.8.1.50 systemctl restart ntp
echo "waiting..."
sleep 7

echo "removing artifacts"
rm -rf artifacts

echo "run the playbook"
ansible-playbook -vvvv -i hosts_new debian_setup.yml
