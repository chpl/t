#!/bin/bash
set -x

source /opt/global_python_venv/bin/activate
pip3 install --user -r requirements.txt
ansible-galaxy collection install community.docker:3.10.4 --force
ansible-galaxy collection install ansible.legacy --force
