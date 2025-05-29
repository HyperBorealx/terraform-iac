variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the VPC and its resources"
  type        = map(string)
  default     = {}
}
variable "name" {
  description = "Name of the VPC"
  type        = string
}
variable "region" {
  description = "AWS region to create the VPC in"
  type        = string
}
