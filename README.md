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

If you want to install any role, it's as simple as running `make`:

```bash
$ make
```

Certain playbooks are available for installing collections of related software in one pass:

* `make monitoring`
* `make homelab`
* `make infra`
* `make devel`
