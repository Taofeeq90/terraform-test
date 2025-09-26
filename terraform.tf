

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.46.0"
    }
  }
}

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

## Notes
- All arguments from the provider documentation are covered.
- Nested blocks (`scale_settings`, `ssh`, `identity`) are implemented with `dynamic` blocks to make them optional.
- Required arguments are mapped directly from `var.settings`.
- Updated provider version to `4.46.0`. 
