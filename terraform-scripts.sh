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
	terraform init
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
  (cd modules/network; terratouch-mods)
  mkdir modules/db
  (cd modules/db; terratouch-mods)
  mkdir modules/web
  (cd modules/web; terratouch-mods)
  mkdir modules/app
  (cd modules/app; terratouch-mods)
}
