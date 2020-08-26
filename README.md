# terraform-azurestack
## Descrption
Terraform azurerm provider using local Azure stack for public and usgov endpoints.

## Local development environment
Repo running on WSL 2 Ubuntu 18.04

## Setup
### Configure
1. Update the environment *.env files to point to the full path of the *.json endpoint files.
1. Update the environment *.env files with the TF_VAR_SUBSCRIPTION_ID, TF_VAR_TENANT_ID and TF_VAR_LOCATION.
1. Update the TF_VAR_BACKEND_STORAGE_ACCOUNT_NAME since this is globally unique for each cloud instance.
1. You are now ready to set the environment variables from the appropriate env file.\
set -a && . environment/dev/dev.env && set +a

Note: using a Windows mounted path from WSL does not work in step 1.

### Deploy
Create the remote storage infrastructure. 
This is a one time initialization of the storage and the state is stored in teh local folder.
1. Navigate to the 01_init folder
1. $ terraform init
1. $ terraform plan
1. $ terraform apply --auto-approve

Create the remote state backed resource. A sample is provided in 02_bas0\1_net
1. Navigate to the 02_base\1_net folder
1. Update the provider.tf with the storage account access key retrieved from:\
Resource group: azstack-remote-state\
Storage account: azstackstore\
Access key  
1. $ terraform init
1. $ terraform plan
1. $ terraform apply --auto-approve
1. The remote state is updated with the state of this terraform

Confirm by accessing the Azure portal\
Resource group: azstack-remote-state\
Storage account: azstackstore\
Container: azstfrs\
Blob: 02_base/01_net (https://yourstorename.blob.core.windows.net/azstfrs/02_base/01_net)

### Destroy
To remove the resources, run this command in the each folder, in reverse order.
1. $ terraform destroy --auto-approve.

Notes: 
* If the environment is completely recreated, a new Access Key will be generated, update will be necessary.
* If changing the Access Key, the .terraform folder in that deployment modeule will have to be deleted before init.



