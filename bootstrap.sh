#! /bin/bash

# Install prerequisites
sudo apt install -y python3-pip
sudo pip3 install -r requirements.txt

ssh -T -oStrictHostKeyChecking=no git@github.com
