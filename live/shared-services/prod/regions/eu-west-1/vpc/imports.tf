# private

import {
  id = "subnet-012dfd10592800c0b"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.private[0]
}

import {
  id = "subnet-071436070936b8e6e"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.private[1]
}

# database
import {
  id = "subnet-0274f44c59dfdb2d0"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.database[0]
}

import {
  id = "subnet-0e81097b473a31c07"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.database[1]
}

# route tables

import {
  id = "rtb-09aabf7ba1fe7b9a2"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table.private[0]
}

import {
  id = "rtb-09eae26c0c2d14d70"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table.private[1]
}

import {
  id = "rtb-03e1247ff461e467c"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table.database[0]
}

import {
  id = "rtb-019138d6781160908"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table.database[1]
}

# vpc
import {
  id = "vpc-0a29462de21f69a10"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_vpc.this[0]
}

# routes

import {
  id = "subnet-0274f44c59dfdb2d0/rtb-03e1247ff461e467c"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table_association.database[0]
}

import {
  id = "subnet-0e81097b473a31c07/rtb-019138d6781160908"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table_association.database[1]
}

import {
  id = "subnet-012dfd10592800c0b/rtb-09aabf7ba1fe7b9a2"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table_association.private[0]
}

import {
  id = "subnet-071436070936b8e6e/rtb-09eae26c0c2d14d70"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table_association.private[1]
}


# Transit Gateway Route
import {
  id = "tgw-rtb-0c12f26443088fdfb_10.97.0.0/16"
  to = module.shared_services_vpc.aws_ec2_transit_gateway_route.per_vpc["shared-service-eks-vpc"]
}

# Transit Gateway VPC Attachment
import {
  id = "tgw-attach-0f6a170f75cf5ceec"  # Replace with actual attachment ID
  to = module.shared_services_vpc.aws_ec2_transit_gateway_vpc_attachment.this["shared-service-eks-vpc"]
}

# Transit Gateway Route Table Association
import {
  id = "tgw-rtb-05978c3d0f79eeb2c_tgw-attach-0f6a170f75cf5ceec"  # Replace with actual attachment ID
  to = module.shared_services_vpc.aws_ec2_transit_gateway_route_table_association.this["shared-service-eks-vpc"]
}

# Routes to Transit Gateway
import {
  id = "rtb-03e1247ff461e467c_0.0.0.0/0"
  to = module.shared_services_vpc.aws_route.database_to_tgw["shared-service-eks-vpc-database-0"]
}

import {
  id = "rtb-019138d6781160908_0.0.0.0/0"
  to = module.shared_services_vpc.aws_route.database_to_tgw["shared-service-eks-vpc-database-1"]
}

import {
  id = "rtb-09aabf7ba1fe7b9a2_0.0.0.0/0"
  to = module.shared_services_vpc.aws_route.private_to_tgw["shared-service-eks-vpc-private-0"]
}

import {
  id = "rtb-09eae26c0c2d14d70_0.0.0.0/0"
  to = module.shared_services_vpc.aws_route.private_to_tgw["shared-service-eks-vpc-private-1"]
}

# VPC Endpoint
import {
  id = "vpce-0a06b9293d95acae7"  # Replace with actual VPC endpoint ID
  to = module.shared_services_vpc.aws_vpc_endpoint.gateway["shared-service-eks-vpc-s3"]
}

# VPC Flow Log
import {
  id = "fl-0a229a850155d5fe5"  # Replace with actual flow log ID
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_flow_log.this[0]
}

import {
  id = "tgw-attach-0f6a170f75cf5ceec"
  to = module.shared_services_vpc.aws_ec2_transit_gateway_vpc_attachment_accepter.this["shared-service-eks-vpc"]
}
