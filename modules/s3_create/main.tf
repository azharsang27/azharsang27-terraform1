resource "aws_s3_bucket" "module_s3_bucket" {
  bucket = var.module_s3_bucket_name

  versioning {
    enabled = true
  }
  
	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm     = var.module_s3_bucket_encryp_type
			}
		}
	}
}