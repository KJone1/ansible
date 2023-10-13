.PHONY: lint play check

# Variables
PLAYBOOK = playbooks/main.yaml
CHECK_PLAYBOOK = --check

# Lint Ansible playbook
lint:
	ansible-lint $(PLAYBOOK)

# Run Ansible playbook
play:
	ansible-playbook $(PLAYBOOK)

# Run Ansible playbook in check mode
check:
	ansible-playbook $(PLAYBOOK) $(CHECK_PLAYBOOK)

