# AWS Secure Landing Zone  
Learning to build an enterprise-grade AWS cloud architecture using Terraform.

## 📌 Overview
This repository contains my learning project on how to design and deploy a **Secure AWS Landing Zone** using **AWS Organizations**, **multi-account architecture**, and **Infrastructure as Code (IaC)** with **Terraform**.

The goal is to understand how large organizations structure their AWS environments using best practices such as:
- Multi-account isolation  
- Organizational Units (OUs)  
- Centralized identity & access management  
- Least privilege access  
- Automated account provisioning  

## 🏗️ Architecture Components
This project currently provisions the following components:

### **1. AWS Organizations**
Using Terraform, I create an AWS Organization with multiple Organizational Units:
- `Security OU`
- `Infrastructure OU`

### **2. AWS Accounts (Provisioned Automatically)**
Terraform provisions multiple member accounts under their respective OUs:

| Account Name | Email | OU |
|--------------|--------|-----|
| Security-Account | rakaadmiharfan+security@gmail.com | Security |
| Logging-Account | rakaadmiharfan+logging@gmail.com | Security |
| Shared-Services-Account | rakaadmiharfan+infra@gmail.com | Infrastructure |
| Dev-Account | rakaadmiharfan+dev@gmail.com | Infrastructure |
| Prod-Account | rakaadmiharfan+prod@gmail.com | Infrastructure |

This structure follows common enterprise landing zone patterns.

### **3. AWS IAM Identity Center (SSO)**
After provisioning the organization, I enabled **IAM Identity Center** to centralize:
- User and group management  
- Access assignments to multiple AWS accounts  
- Permission sets (Admin, ReadOnly, DevOps, etc.)

Users in IAM Identity Center can now log in and choose which account to access.

## 📂 Repository Structure
├── main.tf                # Root Terraform file
├── providers.tf           # AWS provider configuration
├── variables.tf           # Global variables
├── organizations/         # Terraform module for AWS Organization
│     ├── main.tf          # Organization, OUs, and accounts creation
│     ├── variables.tf     # Module variables
│     └── outputs.tf
└── README.md

## 🏛️ Architecture Overview
Root (Organization)
│
├── Security OU
│    ├── Security Account
│    └── Logging Account
│
└── Infrastructure OU
     ├── Shared Services Account
     ├── Dev Account
     └── Prod Account

## ▶️ Getting Started
1. Initialize Terraform : terraform init
2. Review the plan : terraform plan
3. Apply : terraform apply

Terraform will create:
1. AWS Organization
2. OUs
3. AWS Accounts

After creation, verify via AWS Console → Organizations.

## 🔐 Accessing the Accounts
Once IAM Identity Center is enabled:
1. Go to AWS IAM Identity Center
2. Add a user and assign them to the appropriate group
3. Access the login portal (URL shown in IAM Identity Center page)
4. User can switch between Dev / Prod / Security / Shared accounts

## 📌 Future Enhancements
Planned next steps:
Add Landing Zone baseline security controls:
1. GuardDuty
2. Security Hub
3. IAM Access Analyzer
4. CloudTrail organization logging
5. Centralized logging into the Logging Account
6. SCP (Service Control Policies) for governance
7. VPC baseline module per account
8. S3 encryption & KMS governance model
