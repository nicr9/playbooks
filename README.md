# Setting up Development Environment with Ansible

## Instructions

### Prerequisites

Assuming you're starting from a blank slate, you'll need to set a user password,
install `git`, and check out this repo before you get started.

```
passwd $USER
sudo apt-get install -y git # sudo yum install -y git
mkdir -p src/github.com/nicr9; cd !$
git clone https://github.com/nicr9/playbooks
```

### Bootstrap

This script installs some stuff manually that you'll need to actually run
ansible. It creates `~/.extras` and lets you fill in all the important values.
It also creates a new ssh key adds it to `~/.ssh/authorized_keys`.

```
cd playbooks
./bootstrap.sh
```
When it's done you should run the new `~/.extras` file so that you have the
environment variables in the current shell for when you run the playbooks later.

```
source $HOME/.extras
```

### Add ssh keys to github account

At this point, you'll want to add the new key to your github account so
that ansible can checkout your git projects. The bootstrap script above copied
the public key to your clip board so you can visit the [SSH keys setting page](https://github.com/settings/ssh),
press the "Add SSH key" and just paste it into the form.

When that's set up you should change the playbooks remote url scheme so you can
make changes and send them upstream.

```
git remote set-url origin git@github.com:nicr9/playbooks.git
```

### Run the playbook

This should take care of everything else:

```
ansible-playbook -i hosts --ask-become-pass setup.yml
```
