vpcs = {
  noc-test = {
    transit_gateway_id = "tgw-0b7a97e8b64a3801f"
    association_transit_gateway_route_table_id = "tgw-rtb-0c03b8c292459b6a8"
    pan_transit_gateway_route_table_id = "tgw-rtb-09dc873de2987e646"
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
    auto_accept_shared_attachments = false
    tags = {
      Owner       = "NOC"
      DRI         = "NOC"
      Environment = "Sandbox"
      ComputeType = "VPC"
    }
  }
}