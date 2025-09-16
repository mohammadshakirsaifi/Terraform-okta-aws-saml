resource "aws_iam_saml_provider" "okta" {
  name                   = "okta-saml"
  saml_metadata_document = data.http.okta_saml.body
}

data "http" "okta_saml" {
  url = var.okta_idp_metadata_url
}

resource "aws_iam_role" "saml_roles" {
  for_each = toset(var.role_names)
  name     = each.value

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = aws_iam_saml_provider.okta.arn
      },
      Action = "sts:AssumeRoleWithSAML",
      Condition = {
        StringEquals = {
          "SAML:aud" = "https://signin.aws.amazon.com/saml"
        }
      }
    }]
  })
}