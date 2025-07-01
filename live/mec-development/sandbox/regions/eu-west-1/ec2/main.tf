variable "resources" {
  description = "Map of EC2 to create"
  type        = any
}
module "ec2" {
  source    = "../../../../../../_modules/ec2"

  ec2 = var.resources
}