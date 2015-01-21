#!/usr/bin/env bash

wget -O install_salt.sh https://bootstrap.saltstack.com
sh install_salt.sh

cat <<EOF >/etc/salt/minion
master: 192.168.37.10
EOF

service salt-minion restart
