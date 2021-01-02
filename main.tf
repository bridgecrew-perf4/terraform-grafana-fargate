terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Flavor to taste
locals {
    availability_zone_count = 3
    cluster_name            = "Fargate"
}
