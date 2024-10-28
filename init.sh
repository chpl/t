#!/bin/bash

# Display public IP
curl ifconfig.me

# Display Terraform version
terraform version

source /opt/global_python_venv/bin/activate
pip3 install --user -r requirements.txt
ansible-galaxy collection install community.docker:3.10.4 --force
ansible-galaxy collection install ansible.legacy --force
