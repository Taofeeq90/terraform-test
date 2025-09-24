resource "azurerm_ai_foundry" "foundry" {
  name                = var.settings.name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
  key_vault_id        = var.settings.key_vault_id
  storage_account_id  = var.settings.storage_account_id

  application_insights_id        = try(var.settings.application_insights_id, null)
  container_registry_id          = try(var.settings.container_registry_id, null)
  description                    = try(var.settings.description, null)
  friendly_name                  = try(var.settings.friendly_name, null)
  high_business_impact_enabled   = try(var.settings.high_business_impact_enabled, null)
  primary_user_assigned_identity = try(var.settings.primary_user_assigned_identity, null)
  public_network_access          = try(var.settings.public_network_access, null)
  tags                           = try(var.tags, null)

  identity {
    type         = var.settings.identity.type
    identity_ids = try(var.settings.identity.identity_ids, null)
  }

  dynamic "encryption" {
    for_each = try([var.settings.encryption], [])
    content {
      key_id                   = encryption.value.key_id
      key_vault_id             = encryption.value.key_vault_id
      user_assigned_identity_id = try(encryption.value.user_assigned_identity_id, null)
    }
  }

  dynamic "managed_network" {
    for_each = try([var.settings.managed_network], [])
    content {
      isolation_mode = try(managed_network.value.isolation_mode, null)
    }
  }
}

# output

output "id" {
  value = azurerm_ai_foundry.this.id
}

output "discovery_url" {
  value = azurerm_ai_foundry.this.discovery_url
}

output "workspace_id" {
  value = azurerm_ai_foundry.this.workspace_id
}

output "identity" {
  value = azurerm_ai_foundry.this.identity
}

output "attributes" {
  value = azurerm_ai_foundry.this
}

# variable
variable "settings" {
  description = "Configuration map for AI Foundry Hub. Required keys"
  type = any
}
variable "tags" {
    description = "resource tags"
    type = any
}

