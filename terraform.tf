resource "databricks_external_location" "this" {
  name            = var.settings["name"]
  url             = var.settings["url"]
  credential_name = var.settings["credential_name"]
  owner           = try(var.settings["owner"], null)
  comment         = try(var.settings["comment"], null)
  skip_validation = try(var.settings["skip_validation"], null)
  fallback        = try(var.settings["fallback"], null)
  read_only       = try(var.settings["read_only"], null)
  enable_file_events = try(var.settings["enable_file_events"], null)
  force_destroy   = try(var.settings["force_destroy"], null)
  force_update    = try(var.settings["force_update"], null)
  access_point    = try(var.settings["access_point"], null)
  isolation_mode  = try(var.settings["isolation_mode"], null)

  dynamic "encryption_details" {
    for_each = try(var.settings["encryption_details"] != null ? [var.settings["encryption_details"]] : [])
    content {
      sse_encryption_details = lookup(encryption_details.value, "sse_encryption_details", null)
    }
  }

  dynamic "file_event_queue" {
    for_each = try(var.settings["file_event_queue"] != null ? [var.settings["file_event_queue"]] : [])
    content {
      managed_pubsub    = lookup(file_event_queue.value, "managed_pubsub", null)
      managed_aqs       = lookup(file_event_queue.value, "managed_aqs", null)
      managed_sqs       = lookup(file_event_queue.value, "managed_sqs", null)
      provided_pubsub   = lookup(file_event_queue.value, "provided_pubsub", null)
      provided_aqs      = lookup(file_event_queue.value, "provided_aqs", null)
      provided_sqs      = lookup(file_event_queue.value, "provided_sqs", null)
    }
  }
}

variable "settings" {
  description = "Map of settings for the external location"
  type        = map(any)
}

output "id" {
  value       = databricks_external_location.this.id
  description = "ID of the external location"
}

output "created_at" {
  value       = databricks_external_location.this.created_at
  description = "Creation time in epoch milliseconds"
}

output "created_by" {
  value       = databricks_external_location.this.created_by
  description = "Username of creator"
}

output "credential_id" {
  value       = databricks_external_location.this.credential_id
  description = "ID of the storage credential"
}

output "updated_at" {
  value       = databricks_external_location.this.updated_at
  description = "Last modified time in epoch milliseconds"
}

output "updated_by" {
  value       = databricks_external_location.this.updated_by
  description = "Username who last modified the external location"
}


resource "databricks_catalog_workspace_binding" "this" {
  catalog_name  = var.settings["catalog_name"]
  workspace_id  = var.settings["workspace_id"]
  default_catalog = try(var.settings["default_catalog"], null)
  allow_all_workspaces = try(var.settings["allow_all_workspaces"], null)
  owner        = try(var.settings["owner"], null)
  comment      = try(var.settings["comment"], null)

  dynamic "workspace_access_list" {
    for_each = try(var.settings["workspace_access_list"] != null ? var.settings["workspace_access_list"] : [])
    content {
      workspace_id = workspace_access_list.value
    }
  }
}

variable "settings" {
  description = "Map of settings for the catalog workspace binding"
  type        = map(any)
}

output "id" {
  value       = databricks_catalog_workspace_binding.this.id
  description = "The ID of the catalog workspace binding"
}

output "catalog_name" {
  value       = databricks_catalog_workspace_binding.this.catalog_name
  description = "The name of the catalog"
}

output "workspace_id" {
  value       = databricks_catalog_workspace_binding.this.workspace_id
  description = "The ID of the workspace"
}

output "default_catalog" {
  value       = databricks_catalog_workspace_binding.this.default_catalog
  description = "Whether this is the default catalog"
}


resource "databricks_catalog" "this" {
  name                          = var.settings["name"]
  storage_root                  = try(var.settings["storage_root"], null)
  provider_name                 = try(var.settings["provider_name"], null)
  share_name                    = try(var.settings["share_name"], null)
  connection_name               = try(var.settings["connection_name"], null)
  owner                         = try(var.settings["owner"], null)
  isolation_mode                = try(var.settings["isolation_mode"], null)
  enable_predictive_optimization = try(var.settings["enable_predictive_optimization"], null)
  comment                       = try(var.settings["comment"], null)
  properties                    = try(var.settings["properties"], null)
  options                       = try(var.settings["options"], null)
  force_destroy                 = try(var.settings["force_destroy"], null)
}

variable "settings" {
  description = "Map of settings for the catalog"
  type        = map(any)
}

output "id" {
  value       = databricks_catalog.this.id
  description = "ID of the catalog (same as name)"
}

output "name" {
  value       = databricks_catalog.this.name
  description = "Name of the catalog"
}

output "metastore_id" {
  value       = databricks_catalog.this.metastore_id
  description = "ID of the parent metastore"
}

