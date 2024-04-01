// Policy Assignment Variables

variable "policy_name" {
  type        = string
  description = "Policy Assignment Name"
}

variable "policy_display_name" {
  type        = string
  description = "Policy Assignment Display Name"
}

variable "policy_def_id" {
  type        = string
  description = "Policy Definition ID"
}

variable "mg_id" {
  type        = string
  description = "Management Group ID"
}

variable "policy_message" {
  type        = string
  description = "Policy Non Compliance Message"
}

variable "location" {
  type        = string
  description = "Policy Location"
}