#!/bin/sh
trap '/usr/bin/killall -HUP sshd' HUP

if [ -n "$PASSWORD" ]; then
    echo "root:$PASSWORD" | chpasswd
fi

/usr/sbin/sshd
while true; do sleep 3600 & wait; done
