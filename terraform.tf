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


resource "azurerm_machine_learning_datastore_datalake_gen2" "this" {
  name                 = var.settings.name
  workspace_id         = var.settings.workspace_id
  storage_container_id = var.settings.storage_container_id

  tenant_id     = try(var.settings.tenant_id, null)
  client_id     = try(var.settings.client_id, null)
  client_secret = try(var.settings.client_secret, null)
  authority_url = try(var.settings.authority_url, null)

  description   = try(var.settings.description, null)
  service_data_identity = try(var.settings.service_data_identity, null)

  tags = try(var.settings.tags, null)
}

output "id" {
  value       = azurerm_machine_learning_datastore_datalake_gen2.this.id
  description = "The ID of the Data Lake Gen2 datastore."
}

output "name" {
  value       = azurerm_machine_learning_datastore_datalake_gen2.this.name
  description = "The name of the Data Lake Gen2 datastore."
}

output "is_default" {
  value       = azurerm_machine_learning_datastore_datalake_gen2.this.is_default
  description = "Indicates whether this datastore is the default for the Workspace."
}


resource "azurerm_machine_learning_datastore_fileshare" "this" {
  name                 = var.settings.name
  workspace_id         = var.settings.workspace_id
  storage_fileshare_id = var.settings.storage_fileshare_id

  account_key             = try(var.settings.account_key, null)
  shared_access_signature = try(var.settings.shared_access_signature, null)

  description           = try(var.settings.description, null)
  service_data_identity = try(var.settings.service_data_identity, null)

  tags = try(var.settings.tags, null)
}

output "id" {
  value       = azurerm_machine_learning_datastore_fileshare.this.id
  description = "The ID of the File Share datastore."
}

output "name" {
  value       = azurerm_machine_learning_datastore_fileshare.this.name
  description = "The name of the File Share datastore."
}

output "is_default" {
  value       = azurerm_machine_learning_datastore_fileshare.this.is_default
  description = "Indicates whether this datastore is the default for the Workspace."
}





