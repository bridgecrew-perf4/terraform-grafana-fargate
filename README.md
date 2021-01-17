# terraform-grafana-fargate
Terraform module for running Grafana on Fargate

## Pre-Requisites

This module assumes the availability of a Public Route53 zone for DNS CName -> LB Name.
If this is unavailable you will need to remove the Route53 CNAME record creation as well as adjust the Amazon Certificate Manager Cert application.

¯\\_(ツ)_/¯

## Notes

As of now, the custom Docker image in the project is inconsequential. Using the image of 'grafana/grafana' is just fine. 

