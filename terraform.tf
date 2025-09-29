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



resource "azurerm_machine_learning_inference_cluster" "this" {
  name                          = var.settings.name
  kubernetes_cluster_id         = var.settings.kubernetes_cluster_id
  location                      = var.settings.location
  machine_learning_workspace_id = var.settings.machine_learning_workspace_id

  cluster_purpose = try(var.settings.cluster_purpose, null)
  description     = try(var.settings.description, null)

  dynamic "identity" {
    for_each = var.settings.identity != null ? [var.settings.identity] : []
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  dynamic "ssl" {
    for_each = var.settings.ssl != null ? [var.settings.ssl] : []
    content {
      cert                     = try(ssl.value.cert, null)
      cname                    = try(ssl.value.cname, null)
      key                      = try(ssl.value.key, null)
      leaf_domain_label        = try(ssl.value.leaf_domain_label, null)
      overwrite_existing_domain = try(ssl.value.overwrite_existing_domain, null)
    }
  }

  tags = try(var.settings.tags, null)
}


output "id" {
  value       = azurerm_machine_learning_inference_cluster.this.id
  description = "The ID of the Machine Learning Inference Cluster."
}

output "identity" {
  value = azurerm_machine_learning_inference_cluster.this.identity
  description = "The Managed Service Identity information for the Inference Cluster."
}

output "principal_id" {
  value       = try(azurerm_machine_learning_inference_cluster.this.identity[0].principal_id, null)
  description = "The Principal ID for the Service Principal associated with the Managed Identity."
}

output "tenant_id" {
  value       = try(azurerm_machine_learning_inference_cluster.this.identity[0].tenant_id, null)
  description = "The Tenant ID for the Service Principal associated with the Managed Identity."
}


resource "azurerm_machine_learning_synapse_spark" "this" {
  name                          = var.settings.name
  machine_learning_workspace_id = var.settings.machine_learning_workspace_id
  location                      = var.settings.location
  synapse_spark_pool_id         = var.settings.synapse_spark_pool_id

  description        = try(var.settings.description, null)
  local_auth_enabled = try(var.settings.local_auth_enabled, null)

  dynamic "identity" {
    for_each = var.settings.identity != null ? [var.settings.identity] : []
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  tags = try(var.settings.tags, null)
}

output "id" {
  value       = azurerm_machine_learning_synapse_spark.this.id
  description = "The ID of the Machine Learning Synapse Spark."
}

output "identity" {
  value       = azurerm_machine_learning_synapse_spark.this.identity
  description = "The Managed Service Identity information for the Machine Learning Synapse Spark."
}

output "principal_id" {
  value       = try(azurerm_machine_learning_synapse_spark.this.identity[0].principal_id, null)
  description = "The Principal ID for the Managed Identity."
}

output "tenant_id" {
  value       = try(azurerm_machine_learning_synapse_spark.this.identity[0].tenant_id, null)
  description = "The Tenant ID for the Managed Identity."
}





