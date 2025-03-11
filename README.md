# Setting up Development Environment with Ansible

## Instructions

Assuming you're starting from a blank slate, you'll need to set a strong user password:

```bash
$ passwd $USER
```

Then you'll need to run the bootstrap script:

This script installs some dependancies and downloads the playbooks in this repo

```bash
$ curl https://raw.githubusercontent.com/nicr9/playbooks/master/scripts/bootstrap.sh | bash
```

### Running the playbook

Getting started is as simple as running `make`:

```bash
$ make
```
