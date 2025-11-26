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
