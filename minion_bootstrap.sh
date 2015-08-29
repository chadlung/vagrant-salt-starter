#!/usr/bin/env bash

wget -O install_salt.sh https://bootstrap.saltstack.com
sh install_salt.sh -P

cat <<EOF >/etc/salt/minion
master: salt
EOF

cat <<EOF >>/etc/hosts
192.168.37.10 salt
EOF

service salt-minion restart
