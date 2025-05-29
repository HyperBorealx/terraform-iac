# Makefile for Terraform infrastructure management
.PHONY: init plan apply destroy gen-backend new-project clean help init-migrate init-reconfigure
login:
	aws sso login --profile svc-admin
# Default target
setup-accounts:
	echo "Setting up account configuration"
	cd _global && terraform init
	cd _global && terraform apply -auto-approve
# Generate backend configuration
gen-backend:
ifndef DIR
	$(error DIR is not set. Please specify directory path)
endif
	echo "Generating backend configuration for $(DIR)"
	./scripts/generate-backend.sh "$(CURDIR)/$(DIR)"
# Generate provider configuration
gen-provider:
ifndef DIR
	$(error DIR is not set. Please specify directory path)
endif
	echo "Generating provider configuration for $(DIR)"
	./scripts/generate-provider.sh "$(CURDIR)/$(DIR)"

# Generate both backend and provider configurations
gen-all: gen-backend gen-provider
	echo "Generated both backend and provider configurations for $(DIR)"
# Initialize terraform with backend (will prompt for migration if needed)
init: gen-all
	echo "Initializing Terraform in $(DIR)"
	cd $(DIR) && terraform init

# Initialize terraform with backend and migrate state
init-migrate: gen-all
	echo "Initializing Terraform with state migration in $(DIR)"
	cd $(DIR) && terraform init -migrate-state

# Initialize terraform with backend and reconfigure without migrating
init-reconfigure: gen-backend
	echo "Initializing Terraform with reconfiguration (no state migration) in $(DIR)"
	cd $(DIR) && terraform init -reconfigure

# Create plan
plan:
ifndef DIR
	$(error DIR is not set. Please specify directory path)
endif
	echo "Creating plan for $(DIR)"
	cd $(DIR) && terraform plan -out=tfplan

# Apply changes
apply:
ifndef DIR
	$(error DIR is not set. Please specify directory path)
endif
	echo "Applying changes in $(DIR)"
	cd $(DIR) && terraform apply tfplan

# Destroy infrastructur
destroy:
ifndef DIR
	$(error DIR is not set. Please specify directory path)
endif
	echo "Destroying infrastructure in $(DIR)"
	cd $(DIR) && terraform destroy -auto-approve

argod-password:
	htpasswd -nbBC 10 admin "lzwEuVoakMpHgVx" | cut -d ":" -f 2
