#!/bin/sh

set -e

# virsh snapshot-revert --domain ffhl-test-gateway --current
virsh snapshot-revert --domain ffhl-test-gateway 1579128050
echo "restarting timesyncd and ntp"
ssh -q root@10.8.1.50 systemctl restart systemd-timesyncd
ssh -q root@10.8.1.50 systemctl restart ntp
echo "waiting..."
sleep 7

echo "removing artifacts"
rm -rf artifacts

echo "run the playbook"
ansible-playbook -vvvv -i hosts debian_setup.yml
