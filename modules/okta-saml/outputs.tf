output "saml_provider_arn" {
  value = aws_iam_saml_provider.okta.arn
}

output "iam_role_arns" {
  value = [for role in aws_iam_role.saml_roles : role.arn]
}