resource "aws_codebuild_project" "project" {
  name         = "project-fargate-deploy"
  description  = "project-fargate-deploy"
  service_role = aws_iam_role.codebuild_service_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "ap-northeast-1"
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = "<AWS_ACCOUNT_ID>"
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME_NGINX"
      value = "fargate-deploy-nginx"
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/akinori-yamashita-tk/aws-fargate-deploy.git"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }

  vpc_config {
    vpc_id = aws_vpc.vpc.id

    subnets = [
      aws_subnet.dmz_1a.id,
      aws_subnet.dmz_1c.id
    ]

    security_group_ids = [
      aws_security_group.fargate.id,
    ]
  }
}
