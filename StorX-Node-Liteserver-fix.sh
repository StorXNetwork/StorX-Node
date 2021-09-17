#!/bin/bash
echo "Created by Kasiimh1 - https://gist.github.com/kasiimh1/7d6d72e9def6ea6b1103c90ae89007e8"

#Fix 'unable to resolve host VPSHOSTNAME: Name or service not known' on Liteserver!
hostname="$(cat /proc/sys/kernel/hostname)"
echo -n "Do you have the 'hostname: Name or service not known' when signing in via SSH? (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Editing hostfile to add $hostname entry"
    echo "127.0.0.1 " $hostname >> /etc/hosts
fi 

echo "Exiting!"