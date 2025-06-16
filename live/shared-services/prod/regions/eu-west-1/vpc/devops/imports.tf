import {
  id = "subnet-04ec472205986fd3a"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.public[0]
}

import {
  id = "vpc-0a29462de21f69a10"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_vpc.this[0]
}

import {
  id = "subnet-0274f44c59dfdb2d0"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_subnet.database[0]
}


import {
  id = "rtb-03e1247ff461e467c"
  to = module.shared_services_vpc.module.vpcs["shared-service-eks-vpc"].aws_route_table.database[0]
}
