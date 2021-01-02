terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Flavor to taste
locals {
    availability_zone_count = 3
    cluster_name            = "Fargate"
}
