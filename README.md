# Setting up Development Environment with Ansible

## Instructions

### Checking out playbooks

Assuming you're starting from a blank slate, you'll need to install git before
you get started.

```
sudo apt-get install git
git clone https://github.com/nicr9/playbooks
```

### Bootstrap

This script installs some stuff manually that you'll need to actually run
ansible. It also creates a new ssh key adds it to autorized_hosts.

```
cd playbooks
./bootstrap.sh
```

### Add ssh keys to github account

At this point, you'll want to add the new key to your github account so
that ansible can checkout your git projects. You can do that [here](https://github.com/settings/ssh).

When that's set up you should change the playbooks remote url scheme so you can
make changes and send them upstream.

```
git remote set-url origin git@github.com:nicr9/playbooks.git
```

### Run the playbook

This should take care of everything else:

```
ansible-playbook -i hosts --ask-beocme-pass setup.yml
```
