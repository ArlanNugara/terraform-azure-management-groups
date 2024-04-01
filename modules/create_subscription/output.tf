// Create Subscription Output

output "output_sub_id" {
  value       = azurerm_subscription.sub.subscription_id
  description = "Subscription ID"
}