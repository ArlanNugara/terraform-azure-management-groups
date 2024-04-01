// Policy Initiative Output

output "output_principle_id" {
  value       = azurerm_management_group_policy_assignment.assign-policy.identity[0].principal_id
  description = "Policy Assignment Principle ID"
}