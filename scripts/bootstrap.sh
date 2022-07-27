#! /bin/bash

# Install system packages
sudo apt install -y git python3-pip

# Download playbooks
mkdir -p ~/src/github.com/nicr9
git clone https://github.com/nicr9/playbooks ~/src/github.com/nicr9/playbooks

# Install python packages
cd ~/src/github.com/nicr9/playbooks
sudo pip3 install -r requirements.txt
