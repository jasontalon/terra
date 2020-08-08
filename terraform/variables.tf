#CONFIDENTIAL VALUES
#values for the variables below should be stored in environment variables.
#https://www.terraform.io/docs/configuration/variables.html

variable "github_personal_access_token" {
  type    = string
}

variable "access_key" {
  type    = string
}

variable "secret_key" {
  type    = string
}

variable "region" {
  type    = string
}
