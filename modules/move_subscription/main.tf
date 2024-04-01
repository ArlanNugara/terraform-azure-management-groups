// Associate Subscription

resource "azurerm_management_group_subscription_association" "sub_mg_association" {
  management_group_id = var.mg_id
  subscription_id     = var.sub_id
}