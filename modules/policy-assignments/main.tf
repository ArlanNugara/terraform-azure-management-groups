// Assign Policy

resource "azurerm_management_group_policy_assignment" "assign-policy" {
  name                 = var.policy_name
  display_name         = var.policy_display_name
  policy_definition_id = var.policy_def_id
  management_group_id  = var.mg_id
  location             = var.location
  non_compliance_message {
    content = var.policy_message
  }
  parameters = jsonencode(
    {}
  )
  identity {
    type = "SystemAssigned"
  }
}