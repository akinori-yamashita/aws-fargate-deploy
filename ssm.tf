####################
# Parameter
####################
resource "aws_ssm_parameter" "github_personal_access_token" {
  name        = "github-personal-access-token"
  description = "github-personal-access-token"
  type        = "String"
  value       = file("./secrets/github_personal_access_token")
}
