ENV?=local
FLAGS_ENV= ${if ${ENV},-l ${ENV}}

TAGS?=
FLAGS_TAGS= ${if ${TAGS},--tags ${TAGS}}

RUN_PLAYBOOK=ansible-playbook --ask-become-pass ${FLAGS_ENV} ${FLAGS_TAGS}

all: ~/.playbooks.yml
	${RUN_PLAYBOOK} setup.yml

~/.playbooks.yml:
	python3 scripts/configure.py
	chmod 600 ~/.playbooks.yml
