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

variable "tags" {
  type        = map(string)
  description = "Default tags"
  default     = {
    "Project" = "tbd"
    "Owner"   = "tbd"
  }
  
}
variable "secret_policy_map" {
  description = "Map of secret keys to policy info: principals, actions, resources"
  type = map(object({
    principals = list(string)
    actions    = list(string)
  }))
  default = {}
}

