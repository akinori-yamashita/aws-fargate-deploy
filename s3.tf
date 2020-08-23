resource "aws_s3_bucket" "pipeline" {
  bucket = "s3-fargate-deploy-20200823"
  acl    = "private"
}
