#! /bin/bash
## USAGE: bootstrap.sh <email@address.com>

# Install prerequisites
sudo apt-get install ansible ssh

# Backup ansible inventory, add localhost
sudo mv /etc/ansible/hosts{,.orig}

# Create ssh key pair, add to authorized hosts
ssh-keygen -t rsa -b 4096 -C $1
ssh-copy-id $USER@$(hostname)

# Run full setup
ansible-playbook -i hosts --ask-beocme-pass setup.yml
