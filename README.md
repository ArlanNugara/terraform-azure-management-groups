# Introduction

**Coming Soon**

**MG and Sub Image to be added here**

# Prerequisites

## Azure Storage Account

Please create an [Azure Storage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal#create-a-storage-account-1) and a [container](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal#create-a-container) named **tfstate** to store Terraform State Files (You may change the name of the container in **providers.tf**). Please note the Service Principle should have access to the Storage Account. Note the [Access Key](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal#view-account-access-keys) for the Storage Account from Azure Portal.

|Key Name|Value|
|:---|:---|
|ARM-ACCESS-KEY|Azure Storage Account Access Key|

Note :: The details of the Storage Account must be filled in **provider.tf** file backend configuration.

## Enterprise Agreement Billing Account

You will need an Enterprise Agreement billing account in order to create subscription. You will need the following details. Please check [this](https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/direct-ea-administration#view-enrollment-details) official article for more details.

|Key Name|Value|
|:---|:---|
|EA-BILLING-AC-NAME|Enterprise Agreement Billing Account Name|
|EA-NAME|Enterprise Agreement Name|

## Service Connection
Azure DevOps Pipeline requires Service Connection to run tasks. The Service Principle should have access to Key Vault Secrets ([Get and List Permission](https://learn.microsoft.com/en-us/azure/devops/pipelines/release/azure-key-vault?view=azure-devops&tabs=yaml#set-up-azure-key-vault-access-policies)) to retrieve Key Vault Secret Values required during running the task. Please refer to this [official article](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection) for creating the Service Connection from a Service Principle. Note the following values for a Service Principle from Azure Portal.

|Key Name|Value|
|:---|:---|
|ARM-CLIENT-ID|Application ID of the Service Principle|
|ARM-CLIENT-SECRET|Client Secret of the Service Principle|
|ARM-SUBSCRIPTION-ID|Subscription ID of the Key Vault|
|ARM-TENANT-ID|Azure Tenant ID|

## Key Vault
An Azure Key Vault is required to store Secrets which are used by the pipeline to authenticate against Azure and Azure DevOps to perform it's desired operation. Please note the Service Principle mentioned [above](#service-connection) must have **GET** and **LIST** for the Key Vault Secrets. Please [create the secrets](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal#add-a-secret-to-key-vault) in Azure Key Vault. You may refer to the [Service Connection](#service-connection) and [Azure DevOps PAT and URL](#azure-devops-pat-and-url) section for values.

Secrets to be created in Azure Key Vault

```
ARM-CLIENT-ID
ARM-CLIENT-SECRET
ARM-SUBSCRIPTION-ID
ARM-TENANT-ID
ARM-ACCESS-KEY
EA_BILLING_AC_NAME
EA_NAME
```

## Variable Groups
The code needs an Azure DevOps Pipeline Variable Group linked to an existing Azure Key Vault containing the Secrets. Please refer to this [official article](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=yaml#link-secrets-from-an-azure-key-vault) for more details.

# Understanding the Code

The code is simplified to granular level for ease of maintenance and understanding. You may change values as per your convenience.

|Name|Function|
|:---|:---|
|./pipelines/deploy.yaml|Azure DevOps YAML file for Pipeline|
|modules|Terraform code for Creating Subscription, Creating Management Groups, Policy Assignment, RBAC Assignments etc|
|data.tf|Terraform Code for reading existing resources|
|local.tf|Terraform Code for Management Groups, Subscription, Subscription Association and Policy Assignment local values|
|variables.tf|Terraform Code for Management Groups, Subscription, Subscription Association and Policy Assignment Variables|
|main.tf|Terraform Code for creating Subscription, Management Groups, Subscription Association and Policy Assignment|
|provider.tf|Terraform Code for provider configuration|
|terraform.auto.tfvars|Terraform Code for providing variable values in run time|

## Updating Pipeline YAML file with values

Once done with all the [above steps](#prerequisites) update the both the pipeline files inside **.pipelines** folder in the repository.

```
variables:
  - name: AZURE_SERVICE_CONNECTION
    value: '< SERVICE CONNECTION NAME >'
  - group: '< VARIABLE GROUP NAME LINKED TO KEY VAULT >'
```

## Update Provider file with values

You need to update **provider.tf** file with values for the [Azure Storage Account](#azure-storage-account) which will host the Terraform State file.

```
backend "azurerm" {
  resource_group_name  = "< Storage Account Resource Group Name >"
  storage_account_name = "< Storage Account Name >"
  container_name       = "tfstate"
  key                  = "< TFSTATE file name >"
}
```

# Resources Deployed

The code is defined for

* Create / Read Management Groups
* Create Subscriptions
* Associate Subscription to Management Group
* Deploy Built In Policy
* Assign Roles for Built In Policy

# Pipelines

## Creating Deploy Pipeline

Please follow this instruction to create the deploy pipeline

- Go to **Pipelines** in Azure DevOps
- Click on **New Pipeline** from right top corner
- Select **Azure Repos Git**
- Select your repository containing this code
- Select **Existing Azure Pipelines YAML file**
- Select the branch and select path as **/.pipelines/deploy.yaml**
- Click on **Continue**
- Click on **Save** from **Run** drop down menu on top right corner
- You may rename the pipeline by choosing **Rename/move** from top right corner Kebab menu

### Running the Deploy Pipeline

Please follow the instruction to run deploy pipelines

- Go to **Pipelines** in Azure DevOps.
- Click on **All** option and click on the deploy pipeline created above
- Click on **Run Pipeline** from top right corner
- Select **Apply Option** as **No** and click on **Run** button
- Follow the Pipeline Status

**Note :** - It is recommended to keep **Apply Option** as **No** for first time. Once satisfied with the Terraform Plan output you neeed to rerun the Pipeline keeping **Apply Option** as **Yes**.
