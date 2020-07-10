#! /bin/bash

# Install prerequisites
sudo apt install -y xclip python3-pip
sudo pip3 install -r requirements.txt

# Install .extras file and fill it out before executing it
cp ./dotfiles/dotextras.template $HOME/.extras
vim $HOME/.extras
source $HOME/.extras

# Create ssh key pair, add to authorized hosts, add github hostkey
ssh-keygen -t rsa -b 4096 -C $EMAIL
ssh-copy-id $USER@$(hostname)
ssh -T -oStrictHostKeyChecking=no git@github.com

# Put public key into clip board so that it can be easily added to github account
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "Your new key is saved to the clipboard, add it to your github account here: https://github.com/settings/ssh"
