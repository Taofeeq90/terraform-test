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



# Azure Machine Learning Datastore FileShare Module

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
| azurerm_machine_learning_datastore_fileshare.this | resource |

## Inputs
| Name | Description | Type | Required |
|------|-------------|------|----------|
| settings.name | The name of the Machine Learning DataStore | string | yes |
| settings.workspace_id | The ID of the Machine Learning Workspace | string | yes |
| settings.storage_fileshare_id | The ID of the Storage Account File Share | string | yes |
| settings.account_key | The access key of the Storage Account (conflicts with shared_access_signature) | string | no |
| settings.shared_access_signature | The Shared Access Signature of the Storage Account (conflicts with account_key) | string | no |
| settings.description | Text used to describe the asset | string | no |
| settings.service_data_identity | Identity to use when retrieving data. Possible values: `None`, `WorkspaceSystemAssignedIdentity`, `WorkspaceUserAssignedIdentity` | string | no |
| settings.tags | Tags to assign to the DataStore | map(string) | no |

## Outputs
| Name | Description |
|------|-------------|
| id   | The ID of the File Share datastore |
| name | The name of the File Share datastore |
| is_default | Indicates whether this datastore is the default for the Workspace |


# Azure Machine Learning Inference Cluster Module

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
| azurerm_machine_learning_inference_cluster.this | resource |

## Inputs
| Name | Description | Type | Required |
|------|-------------|------|----------|
| settings.name | The name of the Machine Learning Inference Cluster | string | yes |
| settings.kubernetes_cluster_id | The ID of the Kubernetes Cluster | string | yes |
| settings.location | The Azure Region for the Inference Cluster | string | yes |
| settings.machine_learning_workspace_id | The ID of the Machine Learning Workspace | string | yes |
| settings.cluster_purpose | Purpose of the Inference Cluster (`DevTest`, `DenseProd`, `FastProd`). Default = `FastProd` | string | no |
| settings.description | Description of the Inference Cluster | string | no |
| settings.identity.type | Managed Service Identity type (`SystemAssigned`, `UserAssigned`, or both) | string | no |
| settings.identity.identity_ids | List of User Assigned Managed Identity IDs (required if type includes `UserAssigned`) | list(string) | no |
| settings.ssl.cert | Certificate for SSL config (conflicts with `leaf_domain_label` and `overwrite_existing_domain`) | string | no |
| settings.ssl.cname | CNAME for SSL config (conflicts with `leaf_domain_label` and `overwrite_existing_domain`) | string | no |
| settings.ssl.key | Key for SSL config (conflicts with `leaf_domain_label` and `overwrite_existing_domain`) | string | no |
| settings.ssl.leaf_domain_label | Leaf domain label for SSL config (conflicts with `cert`, `cname`, `key`) | string | no |
| settings.ssl.overwrite_existing_domain | Overwrite existing leaf domain (conflicts with `cert`, `cname`, `key`) | bool | no |
| settings.tags | Tags to assign to the Inference Cluster | map(string) | no |

## Outputs
| Name | Description |
|------|-------------|
| id   | The ID of the Machine Learning Inference Cluster |
| identity | Managed Service Identity block |
| principal_id | The Principal ID for the Service Principal |
| tenant_id | The Tenant ID for the Service Principal |



