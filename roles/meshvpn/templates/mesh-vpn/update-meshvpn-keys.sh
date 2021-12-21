#!/bin/bash
set -e

DIR=$(mktemp -d)
DEST="/var/local/ffhl-meshvpn-peers"
REPO="{{ fastd_keys_repo }}"

mkdir -p "$DEST"
git clone "$REPO" "$DIR"
git --git-dir="$DIR/.git" --work-tree="$DEST" reset --hard

rm -rf "$DIR"

{% for instance in mesh_vpn_instances %}
if [ systemctl is-active fastd@{{ instance.name }} ]; then
	systemctl reload 'fastd@{{ instance.name }}.service'
fi
{% endfor %}
