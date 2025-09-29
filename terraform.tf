resource "azurerm_machine_learning_datastore_blobstorage" "this" {
  name                 = var.settings.name
  workspace_id         = var.settings.workspace_id
  storage_container_id = var.settings.storage_container_id

  account_key             = try(var.settings.account_key, null)
  shared_access_signature = try(var.settings.shared_access_signature, null)

  description              = try(var.settings.description, null)
  is_default               = try(var.settings.is_default, null)
  service_data_auth_identity = try(var.settings.service_data_auth_identity, null)

  tags = try(var.settings.tags, null)
}

output "id" {
  value       = azurerm_machine_learning_datastore_blobstorage.this.id
  description = "The ID of the Blob Storage datastore."
}

output "name" {
  value       = azurerm_machine_learning_datastore_blobstorage.this.name
  description = "The name of the Blob Storage datastore."
}



