# Terraform Module: databricks_catalog

## Requirements
- Terraform >= 1.5
- Databricks Provider >= 1.90.0

## Providers

| Name       | Version |
|------------|---------|
| databricks | 1.90.0  |

## Resources

| Name | Type          |
|------|---------------|
| this | databricks_catalog |

## Inputs

| Name                         | Description                                                                 | Type        | Required |
|-------------------------------|-----------------------------------------------------------------------------|------------|----------|
| settings                      | Map of settings for the catalog                                             | map(any)   | yes      |
| settings.name                 | Name of the catalog relative to parent metastore                            | string     | yes      |
| settings.storage_root         | Managed location of the catalog (optional if specified for metastore)       | string     | no       |
| settings.provider_name        | For Delta Sharing Catalogs: name of the delta sharing provider              | string     | no       |
| settings.share_name           | For Delta Sharing Catalogs: name of the share under the share provider      | string     | no       |
| settings.connection_name      | For Foreign Catalogs: name of the connection to an external data source     | string     | no       |
| settings.owner                | Username/groupname/sp application_id of the catalog owner                  | string     | no       |
| settings.isolation_mode       | Whether catalog is accessible from all workspaces or a specific set (ISOLATED or OPEN) | string | no       |
| settings.enable_predictive_optimization | Enable predictive optimization (ENABLE, DISABLE, INHERIT)       | string     | no       |
| settings.comment              | User-supplied free-form text                                                | string     | no       |
| settings.properties           | Extensible catalog properties                                               | map(string)| no       |
| settings.options              | For Foreign Catalogs: name of entity mapping to catalog                     | string     | no       |
| settings.force_destroy        | Delete catalog regardless of contents                                       | bool       | no       |

## Outputs

| Name                         | Description                                 |
|-------------------------------|---------------------------------------------|
| id                            | ID of the catalog (same as name)           |
| name                          | Name of the catalog                         |
| metastore_id                  | ID of the parent metastore                  |








# Terraform Module: databricks_external_location

## Requirements
- Terraform >= 1.5
- Databricks Provider >= 1.90.0

## Providers

| Name       | Version |
|------------|---------|
| databricks | 1.90.0  |

## Resources

| Name | Type                        |
|------|-----------------------------|
| this | databricks_external_location |

## Inputs

| Name                                | Description                                                                                  | Type           | Required |
|-------------------------------------|----------------------------------------------------------------------------------------------|----------------|----------|
| settings                             | Map of settings for the external location                                                   | map(any)       | yes      |
| settings.name                        | Name of the external location (unique within the metastore)                                  | string         | yes      |
| settings.url                         | Path URL in cloud storage (s3://, abfss://, gs://)                                           | string         | yes      |
| settings.credential_name             | Name of the databricks_storage_credential to use                                             | string         | yes      |
| settings.owner                       | Owner of the external location                                                              | string         | no       |
| settings.comment                     | User-supplied free-form text                                                                | string         | no       |
| settings.skip_validation             | Suppress validation errors                                                                  | bool           | no       |
| settings.fallback                    | Enable fallback mode                                                                        | bool           | no       |
| settings.read_only                    | Make external location read-only                                                            | bool           | no       |
| settings.enable_file_events          | Enable managed file events (requires file_event_queue)                                       | bool           | no       |
| settings.force_destroy               | Destroy external location regardless of dependents                                           | bool           | no       |
| settings.force_update                | Update external location regardless of dependents                                           | bool           | no       |
| settings.access_point                | ARN of the S3 access point (AWS)                                                            | string         | no       |
| settings.isolation_mode              | ISOLATION_MODE_ISOLATED or ISOLATION_MODE_OPEN                                              | string         | no       |
| settings.encryption_details          | Map describing encryption options (see module docs)                                         | map(any)       | no       |
| settings.file_event_queue            | Map describing file_event_queue configuration (see module docs)                             | map(any)       | no       |

### **encryption_details**
| Attribute             | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| sse_encryption_details | Map of server-side encryption settings                                      |
| algorithm              | Encryption algorithm (e.g., SSE-S3, SSE-KMS)                               |
| aws_kms_key_arn        | ARN of SSE-KMS key (optional)                                               |

### **file_event_queue**
Supports managed/provided queues across AWS/Azure/GCP. Structure example:

| Attribute                | Description                                           |
|---------------------------|------------------------------------------------------|
| managed_pubsub            | Managed GCP Pub/Sub configuration (optional)        |
| managed_aqs               | Managed Azure Queue Storage configuration (optional)|
| managed_sqs               | Managed Amazon SQS configuration (optional)        |
| provided_pubsub           | Provided GCP Pub/Sub configuration (optional)      |
| provided_aqs              | Provided Azure Storage Queue configuration (optional)|
| provided_sqs              | Provided Amazon SQS configuration (optional)       |

## Outputs

| Name              | Description                                               |
|------------------|-----------------------------------------------------------|
| id                | ID of the external location (same as name)               |
| created_at        | Time external location was created (epoch ms)            |
| created_by        | Username of the creator                                   |
| credential_id     | Unique ID of the storage credential used                 |
| updated_at        | Time external location was last modified (epoch ms)      |
| updated_by        | Username who last modified the external location         |



# Terraform Module: databricks_catalog_workspace_binding

## Requirements
- Terraform >= 1.5
- Databricks Provider >= 1.90.0

## Providers

| Name       | Version |
|------------|---------|
| databricks | 1.90.0  |

## Resources

| Name | Type                                   |
|------|----------------------------------------|
| this | databricks_catalog_workspace_binding   |

## Inputs

| Name                          | Description                                                              | Type     | Required |
|--------------------------------|--------------------------------------------------------------------------|----------|----------|
| settings                       | Map of settings for the catalog workspace binding                        | map(any) | yes      |
| settings.catalog_name          | Name of the catalog                                                      | string   | yes      |
| settings.workspace_id          | ID of the workspace                                                      | string   | yes      |
| settings.default_catalog       | Whether this is the default catalog                                      | bool     | no       |
| settings.allow_all_workspaces  | If true, allows access from all workspaces                               | bool     | no       |
| settings.workspace_access_list | List of workspace IDs that have access (optional if allow_all_workspaces is false) | list(string) | no       |
| settings.owner                 | Owner of the workspace binding                                           | string   | no       |
| settings.comment               | Free-form comment                                                        | string   | no       |

## Outputs

| Name            | Description                             |
|-----------------|-----------------------------------------|
| id              | The ID of the catalog workspace binding |
| catalog_name    | The name of the catalog                  |
| workspace_id    | The ID of the workspace                  |
| default_catalog | Whether this is the default catalog     |
