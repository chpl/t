#!/bin/bash
set -x

python3 -m venv $HOME/ansible
source $HOME/ansible/bin/activate
pip3 install -r requirements.txt
ansible-galaxy collection install community.docker:3.10.4 --force
ansible-galaxy collection install ansible.legacy --force
