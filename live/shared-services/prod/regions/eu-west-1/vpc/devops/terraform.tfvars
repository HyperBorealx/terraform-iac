vpcs = {
  shared-service-eks-vpc = {
    vpc_cidr = "10.97.0.0/16"
    region   = "eu-west-1"
    create_endpoints = ["s3"]
    public_subnets = ["10.97.0.0/24", "10.97.0.0/24"]
    private_subnets = ["10.97.64.0/18", "10.97.128.0/18"]
    database_subnets = ["10.97.2.0/24", "10.97.3.0/24"]
    create_database_subnet_route_table = true
    tags = {
      Owner       = "DevOps"
      DRI         = "DevOps"
      Environment = "Production"
      ComputeType = "VPC"
      SLALevel    = "Tier1"
    }
  }
}