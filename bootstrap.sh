#! /bin/bash
if [ $# -ne 1 ]
then
    echo "USAGE: bootstrap.sh \"<email@address.com>\""
    exit 1
fi

# Install prerequisites
sudo apt-get install -y ansible ssh xclip

# Create ssh key pair, add to authorized hosts, add github hostkey
ssh-keygen -t rsa -b 4096 -C $1
ssh-copy-id $USER@$(hostname)
ssh -T -oStrictHostKeyChecking=no git@github.com

# Put public key into clip board so that it can be easily added to github account
xclip -sel clip < ~/.ssh/id_rsa.pub
