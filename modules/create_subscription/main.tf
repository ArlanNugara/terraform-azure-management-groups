// Create Subscription

resource "azurerm_subscription" "sub" {
  subscription_name = var.sub_name
  billing_scope_id  = var.sub_billing_id
}