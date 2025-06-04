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

# Check if path contains regions or commons
if [[ "$RELATIVE_PATH" == *"/regions/"* ]]; then
  # Handle paths with regions
  REGION=$(echo "$RELATIVE_PATH" | grep -o 'regions/[^/]*' | cut -d'/' -f2)
  RESOURCE_PATH=${RELATIVE_PATH#*/*/regions/*/}
  STATE_KEY="${ACCOUNT}/${ENV}/${REGION}/${RESOURCE_PATH/\//_}"
elif [[ "$RELATIVE_PATH" == *"/commons/"* ]]; then
  # Handle paths with commons
  REGION="global" # Use global for commons resources
  RESOURCE_PATH=${RELATIVE_PATH#*/*/commons/}
  STATE_KEY="${ACCOUNT}/${ENV}/commons/${RESOURCE_PATH/\//_}"
else
  echo "Error: Path format not recognized. Expected path with '/regions/' or '/commons/'"
  exit 1
fi

# Determine resource type and name from path
RESOURCE_TYPE=$(echo "$RESOURCE_PATH" | cut -d'/' -f1)
TEAM_NAME=$(echo "$RESOURCE_PATH" | cut -d'/' -f2)

# Extract profile from global account configuration
echo "Fetching profile for account: $ACCOUNT"
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "~/Desktop/git/terraform-iac")
GLOBAL_DIR="${REPO_ROOT}/_global"

# Check if global state exists
if [ -d "${GLOBAL_DIR}" ] && [ -f "${GLOBAL_DIR}/terraform.tfstate" ]; then
  echo "Getting profile from global account configuration..."
  
  # Debug: Check the actual output format
  echo "Debug: Terraform output structure:"
  ACCOUNTS_JSON=$(cd "${GLOBAL_DIR}" && terraform output -json accounts)
  echo "$ACCOUNTS_JSON" | jq '.'
  
  # More robust approach to extract profile
  if echo "$ACCOUNTS_JSON" | jq -e ".\"$ACCOUNT\"" > /dev/null 2>&1; then
    # Format: { "shared-services": {...}, "dev": {...} }
    PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".\"$ACCOUNT\".profile // \"$ACCOUNT\"")
  elif echo "$ACCOUNTS_JSON" | jq -e ".value.\"$ACCOUNT\"" > /dev/null 2>&1; then
    # Format: { "value": { "shared-services": {...}, "dev": {...} } }
    PROFILE=$(echo "$ACCOUNTS_JSON" | jq -r ".value.\"$ACCOUNT\".profile // \"$ACCOUNT\"")
  else
    echo "Warning: Could not find account '$ACCOUNT' in global configuration"
    PROFILE="$ACCOUNT"
  fi
  echo "Using profile: $PROFILE"
else
  echo "Global account state not found, defaulting to account name as profile"
  PROFILE="$ACCOUNT"
fi

echo "Generating backend configuration for account: $ACCOUNT, environment: $ENV, region: $REGION"

# Handle cases where TEAM_NAME might be empty
if [ -z "$TEAM_NAME" ]; then
  # If we only have one level deep, use the resource type as the name
  STATE_KEY="${ACCOUNT}/${ENV}/${REGION}/${RESOURCE_TYPE}/terraform.tfstate"
else
  # Normal case with both resource type and name
  STATE_KEY="${ACCOUNT}/${ENV}/${REGION}/${RESOURCE_TYPE}/${TEAM_NAME}/terraform.tfstate"
fi

cat > backend.tf << EOL
terraform {
  backend "s3" {
    bucket         = "psl-group-central-terraform-state"
    key            = "${STATE_KEY}"
    region         = "eu-west-1"  # Default to eu-west-1 for state storage
    encrypt        = true
    profile        = "${PROFILE}"
    use_lockfile   = true
  }
}
EOL

echo "Generated S3 backend configuration at $(pwd)/backend.tf"
echo "Key: ${ACCOUNT}/${ENV}/${REGION}/${RESOURCE_TYPE}/${TEAM_NAME}/terraform.tfstate"
echo "Profile: ${PROFILE}"
