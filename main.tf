// MG

module "core_mg" {
  source       = "./modules/management_group"
  mg_id        = local.mg_l1.id
  mg_name      = local.mg_l1.name
  parent_mg_id = local.mg_l1.parent_mg
}

module "l2_mg" {
  source       = "./modules/management_group"
  for_each     = local.mg_l2
  mg_id        = "${var.org}-${each.key}-mg"
  mg_name      = upper("${var.org} ${each.key} mg")
  parent_mg_id = each.value.parent_mg
}

module "l3_mg" {
  source       = "./modules/management_group"
  for_each     = local.mg_l3
  mg_id        = "${var.org}-${each.key}-mg"
  mg_name      = upper("${var.org} ${each.key} mg")
  parent_mg_id = each.value.parent_mg
}

module "subs" {
  source         = "./modules/create_subscription"
  for_each       = local.sub
  sub_name       = lower("${var.org}-${each.key}-sub")
  sub_billing_id = data.azurerm_billing_enrollment_account_scope.ea_billing_account.id
}

module "mg_sub_association" {
  source   = "./modules/move_subscription"
  for_each = local.association
  mg_id    = each.value.mg
  sub_id   = each.value.sub
}

module "policy" {
  source              = "./modules/policy-assignments"
  for_each            = local.policy
  policy_name         = lower("${var.org}-${each.key}")
  policy_display_name = each.value.display_name
  policy_def_id       = each.value.definition
  mg_id               = module.core_mg.output_mg_id
  policy_message      = each.value.message
  location            = each.value.location
}

module "rbac" {
  source                       = "./modules/rbac"
  for_each                     = local.role
  rbac_assignment_scope        = module.core_mg.output_mg_id
  rbac_def_id                  = each.value.def
  rbac_assignment_principle_id = each.value.principle
}