#!/bin/bash
set -eux
apt update -y
apt upgrade -y
apt install -y unzip curl
systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
