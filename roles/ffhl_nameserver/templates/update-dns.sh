#!/bin/bash
set -e

DIR=$(mktemp -d)
DEST="/var/local/ffhl-dns"
REPO="{{ dns_repo_url }}"

mkdir -p "$DEST"
git clone "$REPO" "$DIR"
git --git-dir="$DIR/.git" --work-tree="$DEST" reset --hard

rm -rf "$DIR"

pdns_control reload
