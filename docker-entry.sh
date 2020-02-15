#!/bin/sh

# allow commands to be run from this container
if [ "x$@" != "x" ]; then
	exec $@
fi

# check host keys exist then run sshd
if [ ! -r /etc/ssh/ssh_host_rsa_key -o ! -r /etc/ssh/ssh_host_dsa_key -o ! -r /etc/ssh/ssh_host_ecdsa_key -o ! -r /etc/ssh/ssh_host_ed25519_key ]; then
	ssh-keygen -A
fi

# start sshd
exec /usr/sbin/sshd -e -D
