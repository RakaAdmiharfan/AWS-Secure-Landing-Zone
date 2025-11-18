variable "region" {
  description = "Default AWS region for management account"
  type        = string
  default     = "ap-southeast-3"
}

variable "org_accounts" {
  description = "Organization accounts to create"
  type = map(object({
    email = string
    name  = string
  }))
}
