#Ami Dev VPC
#Subnets

import {
  id = "subnet-0956e4b72d75b911e"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_subnet.private[0]
}

import {
  id = "subnet-03b52eefb5386701e"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_subnet.private[1]
}

#RouteTables

import {
  id = "rtb-03b24a9a493c2672c"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_route_table.private[0]
}

import {
  id = "rtb-07b6d48759b84225c"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_route_table.private[1]
}

#VPC

import {
  id = "vpc-0cab2d3e09d72f2a5"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_vpc.this[0]
} 

#Route Table associations

import {
  id = "subnet-0956e4b72d75b911e/rtb-03b24a9a493c2672c"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_route_table_association.private[0]
} 

import {
  id = "subnet-03b52eefb5386701e/rtb-03b24a9a493c2672c"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_route_table_association.private[1]
} 

# Transit Gateway Route
import {
  id = "tgw-rtb-06a8be512c70a0d5b_10.82.192.0/22"
  to = module.dev-app.aws_ec2_transit_gateway_route.per_vpc["AMI-Dev-VPC"]
}

# Transit Gateway VPC Attachment
import {
  id = "tgw-attach-07465250a9fd67c66"
  to = module.dev-app.aws_ec2_transit_gateway_vpc_attachment.this["AMI-Dev-VPC"]
}

# VPC Flow Log
import {
  id = "fl-03bdd9c2f040002a0"
  to = module.dev-app.module.vpcs["AMI-Dev-VPC"].aws_flow_log.this[0]
}

# VPC Endpoint
import {
  id = "vpce-0bb4622b74c98f6e9"
  to = module.dev-app.aws_vpc_endpoint.gateway["AMI-Dev-VPC-s3"]
}

# Routes to Transit Gateway
import {
  id = "rtb-03b24a9a493c2672c_0.0.0.0/0"
  to = module.dev-app.aws_route.private_to_tgw["AMI-Dev-VPC-private-0"]
}

# Transit Gateway Route Table Association
import {
  id = "tgw-rtb-0315b417518a4b782_tgw-attach-07465250a9fd67c66"
  to = module.dev-app.aws_ec2_transit_gateway_route_table_association.this["AMI-Dev-VPC"]
}

import {
  id = "tgw-attach-07465250a9fd67c66"
  to = module.dev-app.aws_ec2_transit_gateway_vpc_attachment_accepter.this["AMI-Dev-VPC"]
}
