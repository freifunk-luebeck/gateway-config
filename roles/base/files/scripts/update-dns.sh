#!/bin/bash
set -e

DIR=$(mktemp -d)
DEST=/var/local/ffhl-dns
REPO=https://git.luebeck.freifunk.net/FreifunkLuebeck/ffhl-dns.git

mkdir -p "$DEST"
git clone "$REPO" "$DIR"
git --git-dir="$DIR/.git" --work-tree="$DEST" reset --hard

rm -rf $DIR

pdns_control reload
