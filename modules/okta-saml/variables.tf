variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "okta_idp_metadata_url" {
  description = "Okta IdP Metadata URL"
  type        = string
}

variable "role_names" {
  description = "List of IAM role names to create for Okta SSO"
  type        = list(string)
}