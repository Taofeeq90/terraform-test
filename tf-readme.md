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



### README.md

#### Requirements
- Terraform >= 1.3.0
- AzureRM Provider = 4.46.0

#### Providers
| Name    | Version |
|---------|---------|
| azurerm | 4.46.0  |

#### Resources
| Name                                                   | Type     |
|--------------------------------------------------------|----------|
| azurerm_machine_learning_compute_instance.this          | resource |

#### Inputs
| Name     | Description                                           | Type   | Required |
|----------|-------------------------------------------------------|--------|----------|
| settings | Object containing all arguments for the ML instance   | object | yes      |

#### Outputs
| Name | Description                           |
|------|---------------------------------------|
| id   | The ID of the ML Compute Instance     |
| name | The name of the ML Compute Instance   |



