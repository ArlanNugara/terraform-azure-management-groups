// Variables

## General Data Variables

variable "ea_billing_ac_name" {
  type        = string
  description = "EA Billing Account Name"
}

variable "ea_name" {
  type        = string
  description = "EA Name"
}

## Other Variables

variable "org" {
  type        = string
  description = "Organization Short Name"
}

## Policy

variable "asb_definition_id" {
  type        = string
  description = "Azure Security Benchmark Definition ID"
}

variable "asb_noncompliance_message" {
  type        = string
  description = "Azure Security Benchmark Non Compliance Message"
}

variable "asb_role_assignment_id" {
  type        = string
  description = "ASB Role Assignment ID"
}

variable "asb_location" {
  type        = string
  description = "Azure Security Benchmark Policy Location"
}

variable "nist_definition_id" {
  type        = string
  description = "NIST Definition ID"
}

variable "nist_noncompliance_message" {
  type        = string
  description = "NIST Non Compliance Message"
}

variable "nist_role_assignment_id" {
  type        = string
  description = "NIST Role Assignment ID"
}

variable "nist_location" {
  type        = string
  description = "NIST Policy Location"
}

variable "cis_definition_id" {
  type        = string
  description = "CIS Definition ID"
}

variable "cis_noncompliance_message" {
  type        = string
  description = "CIS Non Compliance Message"
}

variable "cis_role_assignment_id" {
  type        = string
  description = "CIS Role Assignment ID"
}

variable "cis_location" {
  type        = string
  description = "CIS Policy Location"
}