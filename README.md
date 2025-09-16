# Terraform Okta-AWS SAML Integration

This project provisions an **Okta SAML Provider** in AWS IAM and sets up IAM roles that can be assumed by users authenticated through Okta.

---

## 📂 Project Structure

```bash
Terraform-okta-aws-saml/
├── modules/
│   └── okta-saml/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── provider.tf
├── variables.tf
├── iam.tf
├── outputs.tf
├── terraform.tfvars.example
└── deploy.sh
```

---

## 🚀 Prerequisites

- AWS CLI configured with appropriate credentials.
- Terraform v1.3+ installed.
- Okta Admin access to create applications and retrieve IdP metadata.

---

## ⚙️ Setup Instructions

### 1. Clone the repo
```bash
git clone https://github.com/your-org/Terraform-okta-aws-saml.git
cd Terraform-okta-aws-saml
```

### 2. Update Variables
Copy the example vars file and edit it:
```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with:
- `okta_idp_metadata_url` (from Okta SAML app)
- `aws_account_id`
- `role_names` you want to provision

### 3. Deploy with Script
```bash
./deploy.sh apply
```

Available commands:
- `./deploy.sh init` → Initialize Terraform backend
- `./deploy.sh plan` → Preview resources
- `./deploy.sh apply` → Deploy resources
- `./deploy.sh destroy` → Tear down resources

## 🚀 Setup Instructions

1. Copy `terraform.tfvars.example` → `terraform.tfvars` and update with your values.
2. Run `./deploy.sh init` to initialize Terraform.
3. Run `./deploy.sh apply` to deploy.
4. Configure Okta AWS app with SAML → map groups to AWS roles.
5. Test logging into AWS via Okta dashboard.

### 4. Okta → AWS Role Mapping
- In Okta, assign users/groups to the AWS app.
- Add `https://signin.aws.amazon.com/saml` as ACS URL.
- Map Okta groups → AWS IAM role ARNs defined in `terraform.tfvars`.

### 5. Test SSO
- Log in to Okta dashboard.
- Launch AWS app.
- You should be redirected into AWS Console with the assumed IAM role.

---

## 🔐 Security Notes
- Always enable MFA in Okta.
- Use least privilege for IAM role policies.
- Audit CloudTrail and Okta logs regularly.

---
## 📊 Architecture

![Architecture Diagram](architecture.png)

---

## 🛠️ Next Steps
- Extend module with **SCIM provisioning** for auto user/group sync.
- Integrate with **AWS IAM Identity Center** for multi-account access.

---
