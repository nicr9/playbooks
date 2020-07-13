#! /bin/bash

# Install prerequisites
sudo apt install -y python3-pip
sudo pip3 install -r requirements.txt

# Install .extras file and fill it out before executing it
cp ./dotfiles/dotextras.template $HOME/.extras
vim $HOME/.extras
source $HOME/.extras

ssh -T -oStrictHostKeyChecking=no git@github.com
