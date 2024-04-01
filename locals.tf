// Locals

locals {
  mg_l1 = {
    id        = "${var.org}-cloud-control-center"
    name      = "${var.org} Cloud Control Center"
    parent_mg = data.azurerm_client_config.current.tenant_id
  }
  mg_l2 = {
    "platform" = {
      parent_mg = module.core_mg.output_mg_id
    }
    "landingzone" = {
      parent_mg = module.core_mg.output_mg_id
    }
    "decommissioned" = {
      parent_mg = module.core_mg.output_mg_id
    }
    "sandbox" = {
      parent_mg = module.core_mg.output_mg_id
    }
  }
  mg_l3 = {
    "identity" = {
      parent_mg = module.l2_mg["platform"].output_mg_id
    }
    "management" = {
      parent_mg = module.l2_mg["platform"].output_mg_id
    }
    "connectivity" = {
      parent_mg = module.l2_mg["platform"].output_mg_id
    }
    "prod" = {
      parent_mg = module.l2_mg["landingzone"].output_mg_id
    }
    "dev" = {
      parent_mg = module.l2_mg["landingzone"].output_mg_id
    }
    "qa" = {
      parent_mg = module.l2_mg["landingzone"].output_mg_id
    }
  }
  sub = {
    "identity"       = {}
    "management"     = {}
    "connectivity"   = {}
    "prod"           = {}
    "dev"            = {}
    "qa"             = {}
    "decommissioned" = {}
    "sandbox"        = {}
  }
  association = {
    "identity" = {
      mg  = module.l3_mg["identity"].output_mg_id
      sub = "/subscriptions/${module.subs["identity"].output_sub_id}"
    }
    "management" = {
      mg  = module.l3_mg["management"].output_mg_id
      sub = "/subscriptions/${module.subs["management"].output_sub_id}"
    }
    "connectivity" = {
      mg  = module.l3_mg["connectivity"].output_mg_id
      sub = "/subscriptions/${module.subs["connectivity"].output_sub_id}"
    }
    "prod" = {
      mg  = module.l3_mg["prod"].output_mg_id
      sub = "/subscriptions/${module.subs["prod"].output_sub_id}"
    }
    "dev" = {
      mg  = module.l3_mg["dev"].output_mg_id
      sub = "/subscriptions/${module.subs["dev"].output_sub_id}"
    }
    "qa" = {
      mg  = module.l3_mg["qa"].output_mg_id
      sub = "/subscriptions/${module.subs["qa"].output_sub_id}"
    }
    "decommissioned" = {
      mg  = module.l2_mg["decommissioned"].output_mg_id
      sub = "/subscriptions/${module.subs["decommissioned"].output_sub_id}"
    }
    "sandbox" = {
      mg  = module.l2_mg["sandbox"].output_mg_id
      sub = "/subscriptions/${module.subs["sandbox"].output_sub_id}"
    }
  }
  policy = {
    "asb" = {
      display_name = "${var.org} Azure Security Benchmark"
      definition   = var.asb_definition_id
      message      = var.asb_noncompliance_message
      location     = var.asb_location
    }
    "nist" = {
      display_name = "${var.org} NIST SP 800-53 R5"
      definition   = var.nist_definition_id
      message      = var.nist_noncompliance_message
      location     = var.nist_location
    }
    "cis" = {
      display_name = "${var.org} CIS Microsoft Azure Foundations Benchmark v1.4.0"
      definition   = var.cis_definition_id
      message      = var.cis_noncompliance_message
      location     = var.cis_location
    }
  }
  role = {
    "asb" = {
      def       = var.asb_role_assignment_id
      principle = module.policy["asb"].output_principle_id
    }
    "nist" = {
      def       = var.nist_role_assignment_id
      principle = module.policy["nist"].output_principle_id
    }
    "cis" = {
      def       = var.cis_role_assignment_id
      principle = module.policy["cis"].output_principle_id
    }
  }
}