// Management Group

resource "azurerm_management_group" "mg" {
  name                       = var.mg_id
  display_name               = var.mg_name
  parent_management_group_id = var.parent_mg_id
}