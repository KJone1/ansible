.PHONY: help lint play check

DEFAULT: help

# Variables
PLAYBOOK = playbooks/main.yaml
CHECK_OPTIONS = --check

help:  ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_.-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) }' $(MAKEFILE_LIST)
	@echo ""

	
lint: ## Lint Ansible playbook
	ansible-lint $(PLAYBOOK)


play: ## Run Ansible playbook
	ansible-playbook $(PLAYBOOK)


check: ## Run Ansible playbook in check mode
	ansible-playbook $(PLAYBOOK) $(CHECK_OPTIONS)

