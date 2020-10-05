# Setting up Development Environment with Ansible

## Instructions

### Prerequisites

Assuming you're starting from a blank slate, you'll need the following to get started:

* set a strong user password
* install `git`
* cloen this repo

```bash
$ passwd $USER
$ sudo apt-get install -y git # sudo yum install -y git
$ mkdir -p ~/src/github.com/nicr9; cd !$
$ git clone https://github.com/nicr9/playbooks
```

### Bootstraping

This script installs some dependancies manually that you'll need to actually run
ansible:

```bash
$ ./scripts/bootstrap.sh
```

### Running the playbook

Getting started is as simple as running `make`:

```bash
$ make
```
