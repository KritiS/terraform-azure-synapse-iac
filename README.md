# Terraform-Azure-Synapse-IaC


## Assignment Overview

This project deploys requested resources in Azure using Terraform which are accessible via Azure Synapse in a secure way with proper network isolation, RBAC,logging and monitoring.

---

## Resources Deployed

- Azure Resource Group
- Azure Synapse Workspace
- Azure SQL Server + Database
- Storage Account (Data Lake Gen2)
- Key Vault
- Virtual Network, Subnet, NSG
- Private Endpoints for Synapse, SQL, and Storage
- Log Analytics Workspace (monitoring)
- Diagnostic Settings (logging)

---

## Security Measures

- Services would be accessed through Private Endpoints.
- NSGs to control subnet-level traffic control.
- RBAC Roles to provide access on resource level:
  - `Reader` on Key Vault for Synapse.
  - `Storage Blob Data Contributor` on Storage.
  - ‘SQL Server Contributor’ on SQL server
- Synapse would access Key Vault and Storage securely though managed identity
- SQL database access through Azure AD authentication

---

##  Maintenance

- Diagnostic logging enabled on Synapse and SQL server.
- Monitoring using Azure Monitor and Log Analytics.
- Terraform to have desired state configuration which can be version controlled and deployed through pipeline.

---

## Monitoring & Logging

- Log Analytics will capture diagnostics.
- Auditing enabled on SQL server.
- Alerts via Azure Monitor 

---

##  Prerequisites

- Azure Subscription
- Terraform v1.3+
- `az login`
- Permissions to create RG, VNet, Private Endpoints, Synapse, SQL, etc.

---

## Usage

# Clone the repository
git clone https://github.com/KritiS/terraform-azure-synapse-iac

cd terraform-azure-synapse-iac

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the deployment
terraform apply
