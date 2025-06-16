variable "domain_name" {
  description = "Main domain name for ACM certificate"
  type        = string
}

variable "domain_sans" {
  description = "Subject Alternative Names for ACM certificate"
  type        = list(string)
}

variable "acm_tags" {
  description = "Tags for the certificate"
  type        = map(string)
  default     = {}
}

variable "domain_to_zone" {
  type        = map(string)
  description = "Mapping from full domain to apex zone"
}

variable "cf_tags" {
  description = "Tags for the certificate"
  type        = map(string)
  default     = {}
}
