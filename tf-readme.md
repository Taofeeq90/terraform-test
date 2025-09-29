### README.md

# Azure Machine Learning Datastore BlobStorage Module

## Requirements
| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| azurerm   | = 3.117.0 |

## Providers
| Name | Version |
|------|---------|
| azurerm | 3.117.0 |

## Resources
| Name | Type |
|------|------|
| azurerm_machine_learning_datastore_blobstorage.this | resource |

## Inputs
| Name | Description | Type | Required |
|------|-------------|------|----------|
| settings.name | The name of the Machine Learning DataStore | string | yes |
| settings.workspace_id | The ID of the Machine Learning Workspace | string | yes |
| settings.storage_container_id | The ID of the Storage Account Container | string | yes |
| settings.account_key | The access key of the Storage Account (conflicts with shared_access_signature) | string | no |
| settings.shared_access_signature | The Shared Access Signature of the Storage Account (conflicts with account_key) | string | no |
| settings.description | Text used to describe the asset | string | no |
| settings.is_default | Specifies whether this DataStore is the default for the Workspace | bool | no |
| settings.service_data_auth_identity | Specifies which identity to use when retrieving data. Possible values: `None`, `WorkspaceSystemAssignedIdentity`, `WorkspaceUserAssignedIdentity` | string | no |
| settings.tags | A mapping of tags to assign to the Machine Learning DataStore | map(string) | no |

## Outputs
| Name | Description |
|------|-------------|
| id   | The ID of the Blob Storage datastore |
| name | The name of the Blob Storage datastore |


# Azure Machine Learning Datastore Data Lake Gen2 Module

## Requirements
| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| azurerm   | = 3.117.0 |

## Providers
| Name | Version |
|------|---------|
| azurerm | 3.117.0 |

## Resources
| Name | Type |
|------|------|
| azurerm_machine_learning_datastore_datalake_gen2.this | resource |

## Inputs
| Name | Description | Type | Required |
|------|-------------|------|----------|
| settings.name | The name of the Machine Learning DataStore | string | yes |
| settings.workspace_id | The ID of the Machine Learning Workspace | string | yes |
| settings.storage_container_id | The ID of the Storage Account Container | string | yes |
| settings.tenant_id | The ID of the Tenant which the Service Principal belongs to | string | no |
| settings.client_id | The object ID of the Service Principal | string | no |
| settings.client_secret | The secret of the Service Principal | string | no |
| settings.authority_url | An URL used for authentication | string | no |
| settings.description | Text used to describe the asset | string | no |
| settings.service_data_identity | Identity to use when retrieving data. Possible values: `None`, `WorkspaceSystemAssignedIdentity`, `WorkspaceUserAssignedIdentity` | string | no |
| settings.tags | Tags to assign to the DataStore | map(string) | no |

## Outputs
| Name | Description |
|------|-------------|
| id   | The ID of the Data Lake Gen2 datastore |
| name | The name of the Data Lake Gen2 datastore |
| is_default | Indicates whether this datastore is the default for the Workspace |


