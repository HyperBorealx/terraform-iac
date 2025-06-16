# terraform-iac

## Requirements

1. SOPS -> brew install sops
2. Terraform
3. AWS Credentials file (~/.aws/credentials) -> see below

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

You need access to the KMS key for decrypting the encrypted values

```text
[default]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 300476207176
region=eu-west-1

[ss]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 300476207176
region=eu-west-1

[ss-testing]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 231913005868
region=eu-west-1

[noc-1]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 675772112610
region=eu-west-1

[noc-2]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 014356704654
region=eu-west-1

[prod-cdn-mec]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 281741030433
region=eu-west-1

[dev-mec]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 205551755912
region=eu-west-1

[main]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 501723963525
region=eu-west-1

[phoenix-prod]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 552908498514
region=eu-west-1

[phoenix-prod-ue1]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=us-east-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 552908498514
region=us-east-1

[prod-data-mgmt]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 229576646719
region=eu-west-1

[leg-mec-sandbox]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 744310742069
region=eu-west-1

[dev-app]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 611787202005
region=eu-west-1

[dev-data]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 343558945232
region=eu-west-1

[dev-data-mgmt]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 283951974467
region=eu-west-1

[leg-prod-data]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 438308937914
region=eu-west-1

[prod-amplify-mec]
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
sso_account_id = 203707943584
region=eu-west-1

[appdev-sandbox]
sso_account_id = 806541498848
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
region=eu-west-1

[soundboard-sandbox]
sso_account_id = 257394484702
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
region=eu-west-1

[soundboard-prod]
sso_account_id = 565393029999
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
region=eu-west-1

[sandbox-data-mgmt]
sso_account_id = 451063263679
sso_start_url=https://pslgroup.awsapps.com/start
sso_region=eu-west-1
sso_role_name = <YOUR SSO ROLE HERE>
region=eu-west-1
```