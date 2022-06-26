#!/usr/bin/python
from ansible.module_utils.basic import AnsibleModule

DOCUMENTATION = '''
---
module: go_install
short_description: Install go executables
options:
  name:
    description:
    - One or more go package references
    - (e.g. github.com/google/go-jsonnet/cmd/jsonnet)
    required: true
    type: list
    elements: str
  executable:
    description:
      - The explicit executable or pathname for the go executable
    required: false
requirements:
- go
author: "Nic Roland <nicroland9@gmail.com>"
'''

EXAMPLES = '''
# Install hub
go_install:
  name: github.com/google/go-jsonnet/cmd/jsonnet

# Specify the path of go command
go_install:
  name: github.com/google/go-jsonnet/cmd/jsonnet
  executable: /usr/local/go/bin/go

# Install from multiple packages
go_install:
  name:
  - github.com/google/go-jsonnet/cmd/jsonnet@latest
  - github.com/google/go-jsonnet/cmd/jsonnetfmt@latest
'''

RETURN = '''
'''


def main():
    module = AnsibleModule(argument_spec={
        "name": {"required": True, "type": "list", "elements": "str"},
        "executable": {"required": False, "default": "go", "type": "str"},
    })
    params = module.params
    packages = params["name"]
    go_exec = params["executable"]

    result = {
        'changed': False,
        'successful': [],
        'executable': go_exec,
    }

    cmd = [go_exec, "install"]
    for pkg in packages:
        rc, out, err = module.run_command(cmd + [pkg])
        result['stdout'] = out
        result['stderr'] = err

        if rc:
            result['failed'] = pkg
            module.fail_json(**result)
        else:
            result['changed'] = True
            result['successful'].append(pkg)

    module.exit_json(**result)


if __name__ == '__main__':
    main()
