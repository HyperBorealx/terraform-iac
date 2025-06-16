module "mec_development" {
  source = "../../../../../../_modules/static-secrets"
  environment = "staging"
  environment_shortname = "staging"
  project = "/phoenix/staging"
  region = "eu-west-1"
  file = "secrets.yaml"
  # secret_policy_map = {
  #   engine-whatsapp = {
  #         principals = ["arn:aws:iam::300476207176:role/phoenix-ss-phoenix-generator-tm-codepipeline-iam-role"]
  #         actions    = ["secretsmanager:GetSecretValue","secretsmanager:DescribeSecret"]
  #   }
  # }
  tags = {
    Owner         = "Dougall"
    BusinessGroup = "Phoenix"
    Environment   = "Staging"
    ComputeType   = "SecretManager"
    SLALevel      = "Tier2"
  }
}
