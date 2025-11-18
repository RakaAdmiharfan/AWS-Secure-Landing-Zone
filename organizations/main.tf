resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "logging" {
  name      = "Logging"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.org.roots[0].id
}

# Create accounts (Security, Logging, Shared, Sandbox, Dev, Prod)
resource "aws_organizations_account" "accounts" {
  for_each = var.org_accounts

  name  = each.value.name
  email = each.value.email

  parent_id = lookup({
    "security"       = aws_organizations_organizational_unit.security.id
    "logging"        = aws_organizations_organizational_unit.logging.id
    "infrastructure" = aws_organizations_organizational_unit.infrastructure.id
    "dev"            = aws_organizations_organizational_unit.workloads.id
    "prod"           = aws_organizations_organizational_unit.workloads.id
  }, each.key)
}
