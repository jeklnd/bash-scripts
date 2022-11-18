#!/bin/bash

# create terraform files and init
function terratouch-envs () {
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

provider "aws" {
  region = "us-east-1"
}
EOT
  touch output.tf
	touch variables.tf
	terraform init
}

function terratouch-mods () {
	touch main.tf
	touch output.tf
	touch variables.tf
  touch providers.tf
  touch versions.tf
	terraform init
}

# create a terraform project folder structure
function terradirs () {
  mkdir environments
  mkdir environments/prod
  mkdir environments/dev
  mkdir modules
  mkdir modules/network
  mkdir modules/db
  mkdir modules/web
  mkdir modules/app
}
