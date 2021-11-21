module "aws_ec2_create" {
	source = "./modules/ec2_create"
	module_ec2_ami = var.root_ec2_ami
	module_instance_type = var.root_instance_type
	module_key_name = var.root_key_name
	module_ec2_name = var.root_ec2_name
}

module "aws_s3_create" {
	source = "./modules/s3_create"
	module_s3_bucket_name = var.root_s3_bucket_name
	module_s3_bucket_encryp_type = var.root_s3_bucket_encryp_type
}

module "aws_provisioners" {
	source = "./modules/provisioners-file-local-remote-exec"
	module_ec2_user = var.root_ec2_user
	module_instance_public_ip = module.aws_ec2_create.module_ec2_public_ip	
	module_ec2_public_ip = module.aws_ec2_create.module_ec2_public_ip
}




resource "aws_s3_bucket" "terraform_state_1" {
  bucket = "tfstate-example-azhar-113"

  versioning {
    enabled = true
  }
  
	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm     = "AES256"
			}
		}
	}
	lifecycle {
	      prevent_destroy = true
	}
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "my-terrraform-backend-table-1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
} 

