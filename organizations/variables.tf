variable "org_accounts" {
  description = "List of AWS Organization accounts to create"
  type = map(object({
    name  = string
    email = string
  }))
}

variable "region" {
  description = "AWS region passed from root module"
  type        = string
}
