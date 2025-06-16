# vpc module

When creating a PR for this there are pre-requisites.

1. Your transit gateway must ALREADY be shared to your account.
2. Your transit gateway route table must already exist and be ready to accept VPC attachments.

Example:

```hcl
vpcs = {
  noc-test = {
    transit_gateway_id = "tgw-0b7a97e8b64a3801f"
    transit_gateway_route_table_id = "tgw-rtb-09dc873de2987e646"
    vpc_cidr = "10.100.4.0/22"
    region   = "eu-west-1"
    create_endpoints = ["s3"]
    public_subnets = [
      "10.100.4.0/26",
      "10.100.4.64/26"
    ]

    private_subnets = [
      "10.100.4.128/26",
      "10.100.4.192/26" 
    ]

    database_subnets = [
      "10.100.5.0/26",
      "10.100.5.64/26"
    ]
    enable_flow_log = false
    create_database_subnet_route_table = true
    tags = {
      Owner       = "NOC"
      DRI         = "NOC"
      Environment = "Sandbox"
      ComputeType = "VPC"
    }
  }
}
```