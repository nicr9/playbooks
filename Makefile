ENV?=local
RUN_PLAYBOOK=ansible-playbook --ask-become-pass -i inventory -l ${ENV}

setup:
	${RUN_PLAYBOOK} setup.yml
