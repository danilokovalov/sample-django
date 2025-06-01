import json
import os

# Шлях до tf_output.json
TF_OUTPUT_PATH = "tf_output.json"
SSH_CONFIG_PATH = os.path.expanduser("~/.ssh/config")


with open(TF_OUTPUT_PATH) as f:
    data = json.load(f)

bastion_ip = data["bastion_public_ip"]["value"]
app1_ip = data["app1_private_ip"]["value"]
app2_ip = data["app2_private_ip"]["value"]
db_ip = data["db_private_ip"]["value"]

ssh_key_path = "~/.ssh/bastion-key.pem"

config_lines = f"""\
Host bastion
  HostName {bastion_ip}
  User ubuntu
  IdentityFile {ssh_key_path}
  StrictHostKeyChecking accept-new

Host app1
  HostName {app1_ip}
  User ubuntu
  IdentityFile {ssh_key_path}
  ProxyJump bastion
  StrictHostKeyChecking accept-new

Host app2
  HostName {app2_ip}
  User ubuntu
  IdentityFile {ssh_key_path}
  ProxyJump bastion
  StrictHostKeyChecking accept-new

Host db
  HostName {db_ip}
  User ubuntu
  IdentityFile {ssh_key_path}
  ProxyJump bastion
  StrictHostKeyChecking accept-new
"""

with open(SSH_CONFIG_PATH, "w") as ssh_config:
    ssh_config.write(config_lines)

print(f"✅ SSH config створено/оновлено: {SSH_CONFIG_PATH}")
