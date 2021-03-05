Freifunk Lübeck Gateway Configuration
=====================================

[Wiki](https://wiki.luebeck.freifunk.net/docs/infrastruktur/gateways/)

This repository provides (mostly) all configurations needed to set up gateways for the Freifunk Lübeck community.

Configuration is based on Ansible. A Vagrantfile for local testing is provided, too.

## Requirements for Local Host

* Ansible (v2+)


## Requirements for Remote Host

Debian unstable, plus:

- python3
- sudo


# Software used:

- radvd [docs](https://linux.die.net/man/5/radvd.conf)
- systemd-networkd:
  - [.network](https://www.freedesktop.org/software/systemd/man/systemd.network.html#)
  - [.netdev](https://www.freedesktop.org/software/systemd/man/systemd.netdev.html)
