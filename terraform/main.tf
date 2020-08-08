provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_vpc" "terravue" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "terravue" {
  vpc_id     = aws_vpc.terravue.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Main"
  }
}

resource "aws_s3_bucket" "terravue" {
}

resource "aws_ecr_repository" "terra-vue" {
  name                 = "terra-vue"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_cloudwatch_log_group" "codebuild_log_group" {
  name = "codebuild_log_group"
}
