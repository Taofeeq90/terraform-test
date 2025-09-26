resource "azurerm_machine_learning_compute_cluster" "this" {
  name                          = var.settings.name
  machine_learning_workspace_id = var.settings.machine_learning_workspace_id
  location                      = var.settings.location
  vm_priority                   = var.settings.vm_priority
  vm_size                       = var.settings.vm_size

  description = try(var.settings.description, null)

  scale_settings {
    max_node_count                       = var.settings.scale_settings.max_node_count
    min_node_count                       = var.settings.scale_settings.min_node_count
    scale_down_nodes_after_idle_duration = var.settings.scale_settings.scale_down_nodes_after_idle_duration
  }

  dynamic "ssh" {
    for_each = try(var.settings.ssh, null) == null ? [] : [var.settings.ssh]
    content {
      admin_username = ssh.value.admin_username
      admin_password = try(ssh.value.admin_password, null)
      key_value      = try(ssh.value.key_value, null)
    }
  }

  dynamic "identity" {
    for_each = try(var.settings.identity, null) == null ? [] : [var.settings.identity]
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  local_auth_enabled        = try(var.settings.local_auth_enabled, null)
  node_public_ip_enabled    = try(var.settings.node_public_ip_enabled, null)
  ssh_public_access_enabled = try(var.settings.ssh_public_access_enabled, null)
  subnet_resource_id        = try(var.settings.subnet_resource_id, null)

  tags = try(var.settings.tags, null)

  timeouts {
    create = try(var.settings.timeouts.create, null)
    delete = try(var.settings.timeouts.delete, null)
    read   = try(var.settings.timeouts.read, null)
    update = try(var.settings.timeouts.update, null)
  }
}
```

### outputs.tf

```
output "id" {
  value = azurerm_machine_learning_compute_cluster.this.id
}

output "name" {
  value = azurerm_machine_learning_compute_cluster.this.name
}

output "location" {
  value = azurerm_machine_learning_compute_cluster.this.location
}

output "identity" {
  value = azurerm_machine_learning_compute_cluster.this.identity
}
```

### variables.tf

```
variable "settings" {
  type = any
  description = <<EOT
Object or map with cluster settings. Keys:
- name (string, required)
- machine_learning_workspace_id (string, required)
- location (string, required)
- vm_priority (string, required; values: Dedicated, LowPriority)
- vm_size (string, required)
- description (string, optional)
- scale_settings (object, required) {
    max_node_count (number, required)
    min_node_count (number, required)
    scale_down_nodes_after_idle_duration (string, required)
  }
- ssh (object, optional) {
    admin_username (string, required)
    admin_password (string, optional)
    key_value (string, optional)
  }
- identity (object, optional) {
    type (string, required)
    identity_ids (list(string), optional)
  }
- local_auth_enabled (bool, optional)
- node_public_ip_enabled (bool, optional)
- ssh_public_access_enabled (bool, optional)
- subnet_resource_id (string, optional)
- tags (map, optional)
- timeouts (object, optional) {
    create (string)
    delete (string)
    read (string)
    update (string)
  }
EOT
}
```

---



---

## Module: ml_compute_instance



### module.tf


resource "azurerm_machine_learning_compute_instance" "this" {
  name                          = var.settings.name
  machine_learning_workspace_id = var.settings.machine_learning_workspace_id
  virtual_machine_size          = var.settings.virtual_machine_size

  authorization_type   = try(var.settings.authorization_type, null)
  description          = try(var.settings.description, null)
  local_auth_enabled   = try(var.settings.local_auth_enabled, null)
  subnet_resource_id   = try(var.settings.subnet_resource_id, null)
  node_public_ip_enabled = try(var.settings.node_public_ip_enabled, null)
  tags                 = try(var.settings.tags, null)

  dynamic "assign_to_user" {
    for_each = try([var.settings.assign_to_user], [])
    content {
      object_id = try(assign_to_user.value.object_id, null)
      tenant_id = try(assign_to_user.value.tenant_id, null)
    }
  }

  dynamic "identity" {
    for_each = try([var.settings.identity], [])
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  dynamic "ssh" {
    for_each = try([var.settings.ssh], [])
    content {
      public_key = ssh.value.public_key
    }
  }
}


### variables.tf

```hcl
variable "settings" {
  description = "Configuration object for ML Compute Instance"
  type = object({
    name                          = string
    machine_learning_workspace_id = string
    virtual_machine_size          = string

    authorization_type   = optional(string)
    description          = optional(string)
    local_auth_enabled   = optional(bool)
    subnet_resource_id   = optional(string)
    node_public_ip_enabled = optional(bool)
    tags                 = optional(map(string))

    assign_to_user = optional(object({
      object_id = optional(string)
      tenant_id = optional(string)
    }))

    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))

    ssh = optional(object({
      public_key = string
    }))
  })
}
```

---

### output.tf

```hcl
output "id" {
  value       = azurerm_machine_learning_compute_instance.this.id
  description = "The ID of the Machine Learning Compute Instance"
}

output "name" {
  value       = azurerm_machine_learning_compute_instance.this.name
  description = "The name of the Machine Learning Compute Instance"
}
```

---


resource "azurerm_machine_learning_workspace" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  application_insights_id = var.settings.application_insights_id
  key_vault_id           = var.settings.key_vault_id
  storage_account_id     = var.settings.storage_account_id

  kind                         = try(var.settings.kind, null)
  container_registry_id         = try(var.settings.container_registry_id, null)
  public_network_access_enabled = try(var.settings.public_network_access_enabled, null)
  image_build_compute_name      = try(var.settings.image_build_compute_name, null)
  description                   = try(var.settings.description, null)
  friendly_name                 = try(var.settings.friendly_name, null)
  high_business_impact          = try(var.settings.high_business_impact, null)
  primary_user_assigned_identity = try(var.settings.primary_user_assigned_identity, null)
  v1_legacy_mode_enabled        = try(var.settings.v1_legacy_mode_enabled, null)
  sku_name                      = try(var.settings.sku_name, null)
  service_side_encryption_enabled = try(var.settings.service_side_encryption_enabled, null)
  tags                          = try(var.settings.tags, null)

  identity {
    type         = var.settings.identity.type
    identity_ids = try(var.settings.identity.identity_ids, null)
  }

  dynamic "encryption" {
    for_each = try(var.settings.encryption, null) == null ? [] : [var.settings.encryption]
    content {
      key_vault_id             = encryption.value.key_vault_id
      key_id                   = encryption.value.key_id
      user_assigned_identity_id = try(encryption.value.user_assigned_identity_id, null)
    }
  }

  dynamic "managed_network" {
    for_each = try(var.settings.managed_network, null) == null ? [] : [var.settings.managed_network]
    content {
      isolation_mode                  = try(managed_network.value.isolation_mode, null)
      provision_on_creation_enabled   = try(managed_network.value.provision_on_creation_enabled, null)
    }
  }

  dynamic "serverless_compute" {
    for_each = try(var.settings.serverless_compute, null) == null ? [] : [var.settings.serverless_compute]
    content {
      subnet_id        = try(serverless_compute.value.subnet_id, null)
      public_ip_enabled = try(serverless_compute.value.public_ip_enabled, null)
    }
  }

  dynamic "feature_store" {
    for_each = try(var.settings.feature_store, null) == null ? [] : [var.settings.feature_store]
    content {
      computer_spark_runtime_version = try(feature_store.value.computer_spark_runtime_version, null)
      offline_connection_name        = try(feature_store.value.offline_connection_name, null)
      online_connection_name         = try(feature_store.value.online_connection_name, null)
    }
  }
}
```

### outputs.tf

```
output "id" {
  value = azurerm_machine_learning_workspace.this.id
}

output "name" {
  value = azurerm_machine_learning_workspace.this.name
}

output "discovery_url" {
  value = azurerm_machine_learning_workspace.this.discovery_url
}

output "workspace_id" {
  value = azurerm_machine_learning_workspace.this.workspace_id
}

output "identity" {
  value = azurerm_machine_learning_workspace.this.identity
}
```

### variables.tf

```
variable "settings" {
  type = any
  description = <<EOT
Object or map with workspace settings. Keys:
- name (string, required)
- resource_group_name (string, required)
- location (string, required)
- application_insights_id (string, required)
- key_vault_id (string, required)
- storage_account_id (string, required)
- identity (object, required) {
    type (string, required)
    identity_ids (list(string), optional)
  }
- kind (string, optional)
- container_registry_id (string, optional)
- public_network_access_enabled (bool, optional)
- image_build_compute_name (string, optional)
- description (string, optional)
- friendly_name (string, optional)
- high_business_impact (bool, optional)
- primary_user_assigned_identity (string, optional)
- v1_legacy_mode_enabled (bool, optional)
- sku_name (string, optional)
- service_side_encryption_enabled (bool, optional)
- encryption (object, optional) {
    key_vault_id (string, required)
    key_id (string, required)
    user_assigned_identity_id (string, optional)
  }
- managed_network (object, optional) {
    isolation_mode (string, optional)
    provision_on_creation_enabled (bool, optional)
  }
- serverless_compute (object, optional) {
    subnet_id (string, optional)
    public_ip_enabled (bool, optional)
  }
- feature_store (object, optional) {
    computer_spark_runtime_version (string, optional)
    offline_connection_name (string, optional)
    online_connection_name (string, optional)
  }
- tags (map, optional)
EOT
}
```



