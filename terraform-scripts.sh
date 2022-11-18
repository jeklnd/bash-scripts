#!/bin/bash

function terratouch-envs () {
  touch main.tf
  touch outputs.tf
	touch variables.tf

	cat >> variables.tf <<EOT
/*
variable "AWS_ACCESS_KEY" {
  default = ""
}

variable "AWS_SECRET_KEY" {
  default = ""
}
*/

variable "AWS_REGION" {
  default     = "us-east-1"
  description = "US East (N. Virginia) Region"
}
EOT

  touch providers.tf
	cat >> providers.tf <<EOT
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
/*
  backend = "" {
    # S3 Backend documentation: https://developer.hashicorp.com/terraform/language/settings/backends/s3
  }
*/
}

provider "aws" {
  region = var.AWS_REGION
  #access_key = var.AWS_ACCESS_KEY
  #secret_key = var.AWS_SECRET_KEY
}
EOT

  touch versions.tf
	cat >> versions.tf <<EOT
/*
terraform {
  required_version = ""
}
*/
EOT
}

function terratouch-mods () {
	touch main.tf
	touch output.tf
	touch variables.tf
}

# create a terraform project folder structure
function terradirs () {
  mkdir environments
  mkdir environments/prod
  (cd environments/prod; terratouch-envs)
  mkdir environments/dev
  (cd environments/dev; terratouch-envs)
  mkdir modules
  mkdir modules/network
  mkdir modules/db
  mkdir modules/web
  mkdir modules/app
}