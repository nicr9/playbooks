# Ansible Playbooks

## Checking out

Assuming you're starting from a blank slate, you'll need to install git before
you get started.

```
sudo apt-get install git
git clone https://github.com/nicr9/playbooks
```

## Bootstraping

This script installs some stuff manually that you'll need to actually run
ansible. It also creates a new ssh key adds it to autorized_hosts.

```
cd playbooks
./bootstrap.sh
```

## Upload key to github now!

At this point, you'll want to add you're new key to you're github account so
that ansible can checkout your git projects. Then change the playbooks remote
url scheme.

```
https://github.com/settings/ssh
git remote set-url origin git@github.com:nicr9/playbooks.git
```

## Run the playbook

This should take care of everything else:

```
ansible-playbook -i hosts --ask-beocme-pass setup.yml
```
