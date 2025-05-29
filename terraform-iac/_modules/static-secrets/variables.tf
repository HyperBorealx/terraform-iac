variable "region" {
  type        = string
  description = "The AWS region"
  default     = "eu-west-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "environment_shortname" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "tbd"
}

variable "file" {
  type = string
  description = "The file to be used for the secrets"
}
