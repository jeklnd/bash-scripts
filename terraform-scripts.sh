#!/bin/bash

# create terraform files and init
function terratouch () {
	touch main.tf
	cat >> main.tf <<EOT
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
EOT
	touch output.tf
	touch variables.tf
	terraform init
}

# create a terraform project folder structure
function terradirs () {
  mkdir 
  mkdir environments
  mkdir environments/prod
  (cd environments/prod; terratouch)
  mkdir environments/dev
  (cd environments/dev; terratouch)
  mkdir modules
  mkdir modules/network
  (cd modules/network; terratouch)
  mkdir modules/db
  (cd modules/db; terratouch)
  mkdir modules/web
  (cd modules/web; terratouch)
  mkdir modules/app
  (cd modules/app; terratouch)
}
