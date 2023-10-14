.PHONY: help lint play check

DEFAULT: help

# Variables
PLAYBOOK = playbooks/main.yaml
CHECK_PLAYBOOK = --check

help:
	@echo "Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
	@echo ""

	
lint: ## Lint Ansible playbook
	ansible-lint $(PLAYBOOK)


play: ## Run Ansible playbook
	ansible-playbook $(PLAYBOOK)


check: ## Run Ansible playbook in check mode
	ansible-playbook $(PLAYBOOK) $(CHECK_PLAYBOOK)

