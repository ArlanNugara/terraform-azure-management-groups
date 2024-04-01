# Introduction

To be filled by **Arlan / Anubhav**

**MG and Sub Image to be added here**

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