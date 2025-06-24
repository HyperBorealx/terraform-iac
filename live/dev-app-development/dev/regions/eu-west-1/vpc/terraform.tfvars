vpcs = {
  staging-shared-eks = {
    transit_gateway_id = "tgw-08f09b45996504712"
    association_transit_gateway_route_table_id = "tgw-rtb-0315b417518a4b782"
    pan_transit_gateway_route_table_id = "tgw-rtb-06a8be512c70a0d5b"
    vpc_cidr = "10.84.148.0/22"
    region   = "eu-west-1"
    create_endpoints = ["s3"] #check
    auto_accept_shared_attachments = true

    private_subnets = [
      "10.84.148.0/23",
      "10.84.150.0/23" 
    ]
    
    tags = {
      Owner       = "NOC"
      DRI         = "NOC"
      Environment = "Staging"
      ComputeType = "VPC"
    }
  }
  staging-shared-db = {
    transit_gateway_id = "tgw-08f09b45996504712"
    association_transit_gateway_route_table_id = "tgw-rtb-0315b417518a4b782"
    pan_transit_gateway_route_table_id = "tgw-rtb-06a8be512c70a0d5b"
    vpc_cidr = "10.84.152.0/23"
    region   = "eu-west-1"
    create_endpoints = ["s3"] #check
    auto_accept_shared_attachments = true

    private_subnets = [
      "10.84.152.0/24",
      "10.84.153.0/24" 
    ]
    
    tags = {
      Owner       = "NOC"
      DRI         = "NOC"
      Environment = "Staging"
      ComputeType = "VPC"
    }
  }



}