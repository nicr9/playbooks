ENV?=
FLAGS_ENV= ${if ${ENV},-l ${ENV}}

TAGS?=
FLAGS_TAGS= ${if ${TAGS},--tags ${TAGS}}

RUN_ANSIBLE=./.venv/bin/ansible
RUN_PIP=./.venv/bin/pip3
RUN_PLAYBOOK=./.venv/bin/ansible-playbook --ask-become-pass ${FLAGS_ENV} ${FLAGS_TAGS}
RUN_PYTHON=./.venv/bin/python3

# Send playbook traces to local otelcol (OTEL/gRPC)
export OTEL_EXPORTER_OTLP_ENDPOINT=localhost:4317
export OTEL_EXPORTER_OTLP_INSECURE=true

all: export OTEL_SERVICE_NAME=playbooks-roles
all: ~/.playbooks.yml
	@ls roles | tofi | xargs ${RUN_PLAYBOOK} -l localhost roles.yml --tags

monitoring: export OTEL_SERVICE_NAME=playbooks-monitoring
monitoring:
	${RUN_PLAYBOOK} monitoring.yml

homelab: export OTEL_SERVICE_NAME=playbooks-homelab
homelab:
	${RUN_PLAYBOOK} -k -i inventory -l homelab homelab.yml

infra: export OTEL_SERVICE_NAME=playbooks-infra
infra:
	${RUN_PLAYBOOK} --ask-pass infra.yml

setup: export OTEL_SERVICE_NAME=playbooks-setup
setup: ~/.playbooks.yml
	${RUN_PLAYBOOK} setup.yml

facts:
	@${RUN_ANSIBLE} -m setup localhost | less

~/.playbooks.yml: ./.venv
	${RUN_PYTHON} scripts/configure.py
	chmod 600 ~/.playbooks.yml

./.venv:
	# Using system python to initialise the venv
	python3 -m venv ./.venv

init: ./.venv
	${RUN_PIP} install -U -r requirements.txt
	${RUN_GALAXY} install -r requirements.yml --force --ignore-errors

.PHONY: facts setup
