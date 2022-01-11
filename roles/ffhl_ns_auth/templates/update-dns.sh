#!/bin/bash
set -e

DIR=$(mktemp -d)
DEST="/var/cache/bind/ffhl"
REPO="{{ dns_repo_url }}"

mkdir -p "$DEST"
git clone "$REPO" "$DIR"
git --git-dir="$DIR/.git" --work-tree="$DEST" reset --hard

rm -rf "$DIR"

chown -R bind:bind "$DEST"

# if this script is started by ansible, named was restarted just before this service
# we need to give named some time to startup
sleep 5

systemctl reload named.service
