output "saml_provider_arn" {
  value = module.okta_saml.saml_provider_arn
}

output "iam_role_arns" {
  value = module.okta_saml.iam_role_arns
}