# azurerm_ai_foundry

## Requirements
- Terraform >= 1.5
- AzureRM provider = 4.45.1

## Providers
| Name | Version |
|------|---------|
| azurerm | 4.45.1 |

## Resources
| Type | Notes |
|------|-------|
| azurerm_ai_foundry | Creates an AI Foundry Hub |

## Inputs
| Name | Type | Required | Description |
|------|------|----------|-------------|
| settings | object | yes | All required and optional arguments for the AI Foundry Hub. See below. |

### `settings` object
- **name** (string, required) – Name of the AI Foundry Hub.  
- **location** (string, required) – Azure region.  
- **resource_group_name** (string, required) – Resource group name.  
- **key_vault_id** (string, required) – Key Vault ID.  
- **storage_account_id** (string, required) – Storage Account ID.  
- **identity** (object, required) – See Identity block.  
- **application_insights_id** (string, optional).  
- **container_registry_id** (string, optional).  
- **description** (string, optional).  
- **encryption** (object, optional) – See Encryption block.  
- **friendly_name** (string, optional).  
- **high_business_impact_enabled** (bool, optional, default = false).  
- **managed_network** (object, optional) – See Managed Network block.  
- **primary_user_assigned_identity** (string, optional).  
- **public_network_access** (string, optional, default = "Enabled").  
- **tags** (map(string), optional).  

#### Identity block
- **type** (string, required) – Possible values: `SystemAssigned`, `UserAssigned`, or `SystemAssigned, UserAssigned`.  
- **identity_ids** (list(string), optional) – Required if type includes `UserAssigned`.  

#### Encryption block
- **key_id** (string, required).  
- **key_vault_id** (string, required).  
- **user_assigned_identity_id** (string, optional).  

#### Managed Network block
- **isolation_mode** (string, optional). Allowed: `Disabled`, `AllowOnlyApprovedOutbound`, `AllowInternetOutbound`.  

## Outputs
| Name | Description |
|------|-------------|
| id | Resource ID |
| discovery_url | Discovery service endpoint |
| workspace_id | Immutable workspace ID |
| identity | Identity attributes (principal_id, tenant_id) |
| attributes | Full resource object |
