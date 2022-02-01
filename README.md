# terraform-azure-storage

######

Using this Terraform template we can provision Azure Storage functions. Following the guidelines, you can provide function details and the template handles the rest.

To make use of this module, you need to take note of the following:
1. Define a terraform azurem resource group block
    ```
        resource "azurerm_resource_group" "rg" {
            name     = var.resource_group_location
            location = var.resource_group_location
            }
    ```

2. Define the secret values of the provider, they are needed to authenticate to Azure.
    ```
    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
    ```
    This can be done from the vars.tfvars file.
3. The values of the resource group block are passed as input to following variables of the module
    ```
    - resource_group_name      = azurerm_resource_group.rg.name
    - resource_group_location  = azurerm_resource_group.rg.location
    ```
4. Variables can be defined in the vars.tfvars file. A template can be seen on the repository.
General variables can be seen below.

Variables are as follows:
| Input variables | Description |
| ------------- | ------------- |
| storage_account_name | Name of the azure storage |
| account_tier | Defines the Tier to use for this storage account. Valid options are Standard and Premium
| account_replication_type | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS |
| account_kind | Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2 |
| env_name | environment name e.g dev, prod etc. |

Resource Group Variables

| Input variables | Description |
| ------------- | ------------- |
| resource_group_name | The name of the resource group in which to create the storage account |
| resource_group_location | Specifies the supported Azure location where the resource exists.


Provider Variables are as follows:
| Input variables | Description |
| ------------- | ------------- |
| subscription_id | ARM subscription id |
| client_id | ARM client id. |
| client_secret | ARM client secret |
| tenant_id | ARM tenant id 



Below, the provider requirement for module implementation and the infrastructure provider
| Requirements | |
|:---- | ----:|
|Name | Version |
|terraform | ~> 1.0, latest preferred |
| azurerm | ~> 2.29.0, latest preferred |