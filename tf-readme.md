### README.md

# azurerm_machine_learning_compute_cluster - module

## Requirements
- Terraform 1.3+ (recommended)
- azurerm provider v4.46.0

## Providers
| Name | Version |
|------|---------|
| hashicorp/azurerm | 4.46.0 |

## Resources
| Resource | Notes |
|---|---|
| azurerm_machine_learning_compute_cluster.this | Creates a compute cluster in Azure ML workspace |

## Inputs
| Name | Type | Required | Description |
|---|---:|:---:|---|
| settings | any | yes | Map/object with cluster settings (see variable description) |

## Outputs
| Name | Description |
|---|---|
| id | ID of the compute cluster |
| name | Name of the compute cluster |
| location | Location of the compute cluster |
| identity | Identity block of the compute cluster |


