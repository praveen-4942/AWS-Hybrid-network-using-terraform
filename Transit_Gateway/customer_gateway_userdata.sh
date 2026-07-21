#!/bin/bash

apt update -y

DEBIAN_FRONTEND=noninteractive apt install -y strongswan

echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

sysctl -p

ip link add dummy0 type dummy

ip addr add 192.168.100.10/24 dev dummy0

ip link set dummy0 up

echo "Customer Gateway Configured" > /home/ubuntu/setup.log