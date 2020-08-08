
resource "aws_codebuild_project" "terravue_builder" {
  tags = {
    "Environment" = "test"
  }
  name = "terravue_builder"

  service_role   = aws_iam_role.codebuild_terravue_iam_role.arn
  source_version = "master"
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true #set to true for using docker inside the image
  }
  source {
    type            = "GITHUB"
    location        = "https://github.com/jasontalon/terra.git"
    git_clone_depth = 1
  }
  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.codebuild_log_group.name
    }

    s3_logs {
      status   = "ENABLED"
      location = "${aws_s3_bucket.terravue.id}/build-log"
    }
  }
}

resource "aws_codebuild_source_credential" "github" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = var.github_personal_access_token
}