#!/bin/bash
set -eux

apt update -y
apt upgrade -y

apt install -y unzip curl openssh-server postgresql

systemctl enable ssh
systemctl start ssh
