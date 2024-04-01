// Data

data "azurerm_client_config" "current" {}

data "azurerm_billing_enrollment_account_scope" "ea_billing_account" {
  billing_account_name    = var.ea_billing_ac_name
  enrollment_account_name = var.ea_name
}