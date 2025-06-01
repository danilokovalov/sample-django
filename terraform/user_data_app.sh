#!/bin/bash
set -eux

apt update -y
apt upgrade -y

apt install -y python3 python3-pip unzip curl openssh-server

systemctl enable ssh
systemctl start ssh
