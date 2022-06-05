ENV?=
FLAGS_ENV= ${if ${ENV},-l ${ENV}}

TAGS?=
FLAGS_TAGS= ${if ${TAGS},--tags ${TAGS}}

RUN_PLAYBOOK=ansible-playbook --ask-become-pass ${FLAGS_ENV} ${FLAGS_TAGS}

# Send playbook traces to local otelcol (OTEL/gRPC)
export OTEL_EXPORTER_OTLP_ENDPOINT=localhost:4317
export OTEL_EXPORTER_OTLP_INSECURE=true

all: ~/.playbooks.yml
	${RUN_PLAYBOOK} setup.yml

monitoring: export OTEL_SERVICE_NAME=playbooks-monitoring
monitoring:
	${RUN_PLAYBOOK} monitoring.yml

infra: export OTEL_SERVICE_NAME=playbooks-infra
infra:
	${RUN_PLAYBOOK} infra.yml

roles: export OTEL_SERVICE_NAME=playbooks-roles
roles: ~/.playbooks.yml
	${RUN_PLAYBOOK} roles.yml

init:
	ansible-galaxy install -r requirements.yml --force --ignore-errors

facts:
	@ansible -m setup localhost | less

~/.playbooks.yml:
	python3 scripts/configure.py
	chmod 600 ~/.playbooks.yml

.PHONY: facts roles
