#!/bin/sh

{% for instance in mesh_vpn_instances %}
systemctl reload 'fastd@{{ instance.name }}.service'
{% endfor %}

exit 0
