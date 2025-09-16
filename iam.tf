module "okta_saml" {
  source                 = "./modules/okta-saml"
  aws_account_id         = var.aws_account_id
  okta_idp_metadata_url  = var.okta_idp_metadata_url
  role_names             = var.role_names
}