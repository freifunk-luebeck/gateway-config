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
systemctl reload 'fastd@{{ instance.name }}.service'
{% endfor %}
