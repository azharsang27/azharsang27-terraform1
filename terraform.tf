terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = ">=2.7.0"
		}
	}
	
	backend "s3" {
		bucket = "tfstate-example-azhar-113"
		key = "statefile/terraform.tfstate"
		region = "us-east-2"
	}
}