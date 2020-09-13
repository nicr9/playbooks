ENV?=local
RUN_PLAYBOOK=ansible-playbook --ask-become-pass -l ${ENV}

setup:
	${RUN_PLAYBOOK} setup.yml

system:
	${RUN_PLAYBOOK} system.yml

desktop:
	${RUN_PLAYBOOK} desktop.yml

development:
	${RUN_PLAYBOOK} development.yml
