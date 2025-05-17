ENV?=
FLAGS_ENV= ${if ${ENV},-l ${ENV}}

TAGS?=
RUN_W_TAGS= ${if ${TAGS},${RUN_PLAYBOOK} --tags ${TAGS},ls roles | tofi | xargs -I% ${RUN_PLAYBOOK} --tags %}

RUN_ANSIBLE=/opt/ansible/bin/ansible
RUN_GALAXY=/opt/ansible/bin/ansible-galaxy
RUN_PIP=/opt/ansible/bin/pip3
RUN_PLAYBOOK=/opt/ansible/bin/ansible-playbook --ask-become-pass ${FLAGS_ENV}
RUN_PYTHON=/opt/ansible/bin/python3

# Send playbook traces to local otelcol (OTEL/gRPC)
export OTEL_EXPORTER_OTLP_ENDPOINT=localhost:4317
export OTEL_EXPORTER_OTLP_INSECURE=true

all: export OTEL_SERVICE_NAME=playbooks-roles
all: ~/.playbooks.yml
	${RUN_W_TAGS} -l localhost roles.yml

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

~/.playbooks.yml: /opt/ansible/
	${RUN_PYTHON} scripts/configure.py
	chmod 600 ~/.playbooks.yml

/opt/ansible/:
	sudo mkdir /opt/ansible
	sudo chown ${USER}:${USER} /opt/ansible
	python3 -m venv /opt/ansible

init: /opt/ansible/
	${RUN_PIP} install -U -r requirements.txt
	${RUN_GALAXY} install -r requirements.yml --force --ignore-errors

.PHONY: facts setup
