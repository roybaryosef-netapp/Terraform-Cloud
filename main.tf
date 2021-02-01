terraform {
  required_providers {
    spotinst = {
      source = "spotinst/spotinst"
      version = "1.33.0"
    }
  }
}


provider "spotinst" {
   token   = "${var.spot_token}"
   account = "${var.spot_account}"
}

resource "spotinst_elastigroup_aws" "Terraform" {
  name = "Roy Terraform Git"

  spot_percentage = 100

  orientation = "balanced"

  draining_timeout = 120

  fallback_to_ondemand = true

  revert_to_spot {
    perform_at = "always"
  }

  desired_capacity = 2

  min_size = 1

  max_size = 3

  capacity_unit = "instance"

  instance_types_ondemand = "t2.micro"

  instance_types_spot = ["t2.micro", "t2.small", "t3.micro", "t3.small"]

  subnet_ids = ["subnet-2e2e2465", "subnet-db7990a3", "subnet-ed8f74b0", "subnet-60a6d54b"]

  product = "Linux/UNIX"

  security_groups = ["sg-07648da43a33fe6b8"]

  enable_monitoring = false

  ebs_optimized = false

  image_id = "ami-082b5a644766e0e6f"

  key_name = "Roy_key"

  placement_tenancy = "default"

  region = "us-west-2"
}
