#! /bin/bash

# Install system packages
sudo apt install -y git python3.12-venv # python3-pip

# Download playbooks
mkdir -p ~/src/github.com/nicr9
git clone https://github.com/nicr9/playbooks ~/src/github.com/nicr9/playbooks
cd ~/src/github.com/nicr9/playbooks

# Set up venv with ansible, install all basic requirements
make init setup
