resource "github_repository_webhook" "webhook" {
  repository = "aws-fargate-deploy"
 
  configuration {
    url          = aws_codepipeline_webhook.webhook.url
    content_type = "json"
    insecure_ssl = true
    secret       = aws_ssm_parameter.github_personal_access_token.value
  }
 
  events = ["push"]
}
