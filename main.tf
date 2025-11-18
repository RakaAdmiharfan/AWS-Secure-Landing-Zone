module "organization" {
  source        = "./organizations"
  org_accounts  = var.org_accounts
  region        = var.region
}
