#!/bin/bash
set -e

# Function to extract account name from path
extract_account() {
  local path=$1
  for account in "shared-services" "dev" "prod"; do
    if [[ $path == *"/$account/"* ]]; then
      echo $account
      return
    fi
  done
  echo "unknown-account"
}

# Get the current directory or specified directory
CURRENT_DIR=${1:-$(pwd)}
cd "$CURRENT_DIR"

# Extract components from path
RELATIVE_PATH=${CURRENT_DIR#*live/}
ACCOUNT=$(extract_account "$CURRENT_DIR")
ENV=$(echo "$RELATIVE_PATH" | cut -d'/' -f2)
REGION=$(echo "$RELATIVE_PATH" | grep -o 'regions/[^/]*' | cut -d'/' -f2)
RESOURCE_PATH=${RELATIVE_PATH#*/*/regions/*/}

# Determine resource type and name from path
RESOURCE_TYPE=$(echo "$RESOURCE_PATH" | cut -d'/' -f1)
RESOURCE_NAME=$(echo "$RESOURCE_PATH" | cut -d'/' -f2)

# Repository root detection
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "/Users/zidan.ahmed/Desktop/git/terraform-iac")
GLOBAL_DIR="${REPO_ROOT}/_global"

# Extract account information from global configuration
echo "Fetching configuration for account: $ACCOUNT"
if [ -d "${GLOBAL_DIR}" ] && [ -f "${GLOBAL_DIR}/terraform.tfstate" ]; then
  echo "Getting account info from global configuration..."
  
  # Debug output for troubleshooting
  ACCOUNTS_JSON=$(cd "${GLOBAL_DIR}" && terraform output -json accounts)
  echo "Debug: Terraform output structure (first 300 chars):"
  echo "${ACCOUNTS_JSON:0:300}"
  
  # More robust approach to extract profile
  if echo "$ACCOUNTS_JSON" | jq -e ".\"$ACCOUNT\"" > /dev/null 2>&1; then
    # Format: { "shared-services": {...}, "dev": {...} }
    ACCOUNT_ID=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".id")
    ROLE_ARN=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".role_arn")
    EXTERNAL_ID=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".external_id")
    PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".profile // \"$ACCOUNT\"")
    BACKEND_ACCOUNT=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".backend_account // \"shared-services\"")
  elif echo "$ACCOUNTS_JSON" | jq -e ".value.\"$ACCOUNT\"" > /dev/null 2>&1; then
    # Format: { "value": { "shared-services": {...}, "dev": {...} } }
    ACCOUNT_ID=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".id")
    ROLE_ARN=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".role_arn")
    EXTERNAL_ID=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".external_id")
    PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".profile // \"$ACCOUNT\"")
    BACKEND_ACCOUNT=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".backend_account // \"shared-services\"")
  else
    echo "Warning: Could not find account '$ACCOUNT' in global configuration"
    ACCOUNT_ID="unknown"
    ROLE_ARN="unknown"
    EXTERNAL_ID="unknown"
    PROFILE="$ACCOUNT"
    BACKEND_ACCOUNT="shared-services"
  fi
else
  echo "Global account state not found, defaulting to basic values"
  ACCOUNT_ID="unknown"
  ROLE_ARN="unknown"
  EXTERNAL_ID="unknown"
  PROFILE="$ACCOUNT"
  BACKEND_ACCOUNT="shared-services"
fi

# Get backend profile 
if [ "$BACKEND_ACCOUNT" != "$ACCOUNT" ]; then
  echo "Using separate backend account: $BACKEND_ACCOUNT"
  
  # Try to get backend profile
  if echo "$ACCOUNTS_JSON" | jq -e ".\"$BACKEND_ACCOUNT\"" > /dev/null 2>&1; then
    BACKEND_PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$BACKEND_ACCOUNT\".profile // \"$BACKEND_ACCOUNT\"")
  elif echo "$ACCOUNTS_JSON" | jq -e ".value.\"$BACKEND_ACCOUNT\"" > /dev/null 2>&1; then
    BACKEND_PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$BACKEND_ACCOUNT\".profile // \"$BACKEND_ACCOUNT\"")
  else
    BACKEND_PROFILE="$BACKEND_ACCOUNT"
  fi
  
  echo "Backend profile: $BACKEND_PROFILE"
else
  BACKEND_PROFILE="$PROFILE"
fi

echo "Using account profile: $PROFILE"
echo "Using backend profile: $BACKEND_PROFILE"

# Generate provider configuration
cat > provider.tf <<EOL
provider "aws" {
  region = "${REGION}"
  profile = "${PROFILE}"
}
EOL

echo "Provider configuration created at ${RESOURCE_PATH}/provider.tf"