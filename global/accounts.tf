locals {
  accounts = {
    ss = {
      id          = "300476207176"
      region      = "eu-west-1"
      profile     = "ss"
      environment = "prod"
      purpose     = "shared services account where terraform and other shared services are deployed"
    }
    ss-testing = {
      id          = "231913005868"
      region      = "eu-west-1"
      profile     = "ss-testing"
      environment = "develop"
      purpose     = "shared services testing account"
    }
    noc-1 = {
      id          = "675772112610"
      region      = "eu-west-1"
      profile     = "noc-1"
      environment = "develop"
      purpose     = "noc testing account"
    }
    noc-2 = {
      id          = "014356704654"
      region      = "eu-west-1"
      profile     = "noc-2"
      environment = "develop"
      purpose     = "noc testing account"
    }
    prod-cdn-mec = {
      id          = "281741030433"
      region      = "eu-west-1"
      profile     = "prod-cdn-mec"
      environment = "prod"
      purpose     = "cdn"
    }
    dev-mec = {
      id          = "205551755912"
      region      = "eu-west-1"
      profile     = "dev-mec"
      environment = "develop|staging|integration"
      purpose     = "development account for MEC serverless applications"
    }
    main = {
      id          = "501723963525"
      region      = "eu-west-1"
      profile     = "main"
      environment = "prod"
      purpose     = "main account where many production resources are deployed"
    }
    phoenix-prod = {
      id          = "552908498514"
      region      = "eu-west-1"
      profile     = "phoenix-prod"
      environment = "prod"
      purpose     = "phoenix account where cloudfronts, s3 frontend applications and serverless applications are deployed"
    }
    phoenix-prod-ue1 = {
      id          = "552908498514"
      region      = "us-east-1"
      profile     = "phoenix-prod-ue1"
      environment = "prod"
      purpose     = "phoenix account where cloudfronts and acms are deployed in us-east-1"
    }
    prod-data-mgmt = {
      id          = "229576646719"
      region      = "eu-west-1"
      profile     = "prod-data-mgmt"
      environment = "prod"
      purpose     = "production data management account"
    }
    leg-mec-sandbox = {
      id          = "744310742069"
      region      = "eu-west-1"
      profile     = "leg-mec-sandbox"
      environment = "sandbox"
      purpose     = "sandbox account for MEC applications"
    }
    dev-app = {
      id          = "611787202005"
      region      = "eu-west-1"
      profile     = "dev-app"
      environment = "develop|staging|integration"
      purpose     = "development account for AMI|FW applications"
    }
    dev-data = {
      id          = "343558945232"
      region      = "eu-west-1"
      profile     = "dev-data"
      environment = "develop|staging|integration"
      purpose     = "development account for data management applications"
    }
    dev-data-mgmt = {
      id          = "283951974467"
      region      = "eu-west-1"
      profile     = "dev-data-mgmt"
      environment = "develop|staging|integration"
      purpose     = "development account for data management applications"
    }
    leg-prod-data = {
      id          = "438308937914"
      region      = "eu-west-1"
      profile     = "leg-prod-data"
      environment = "prod"
      purpose     = "production account for data management applications"
    }
    prod-amplify-mec = {
      id          = "203707943584"
      region      = "eu-west-1"
      profile     = "prod-amplify-mec"
      environment = "prod"
      purpose     = "production account for MEC amplify applications (legacy)"
    }
    appdev-sandbox = {
      id          = "806541498848"
      region      = "eu-west-1"
      profile     = "appdev-sandbox"
      environment = "sandbox"
      purpose     = "sandbox account for application development (AMI/FW)"
    }
    soundboard-sandbox = {
      id          = "257394484702"
      region      = "eu-west-1"
      profile     = "soundboard-sandbox"
      environment = "development|staging|integration"
      purpose     = "sandbox account for AMI soundboard applications"
    }
    soundboard-prod = {
      id          = "565393029999"
      region      = "eu-west-1"
      profile     = "soundboard-prod"
      environment = "prod"
      purpose     = "production account for AMI soundboard applications"
    }
    sandbox-data-mgmt = {
      id          = "451063263679"
      region      = "eu-west-1"
      profile     = "sandbox-data-mgmt"
      environment = "sandbox"
      purpose     = "sandbox account for data management applications"
    }
  }
}

output "accounts" {
  value = local.accounts
}
