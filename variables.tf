variable "root_ec2_ami" {
	type = string
	default = "ami-0629230e074c580f2"
}

variable "root_instance_type" {
	type = string
	default = "t2.micro"
}

variable "root_key_name" {
	type = string
	default = "Devops_linux_pem"
}

variable "root_ec2_name" {
	type = string
	default = "module-ec2"
}

variable "root_s3_bucket_name" {
	type = string
	default = "azhar-121-azhar-121"
}


variable "root_s3_bucket_encryp_type" {
	type = string
	default = "AES256"
}


variable "root_ec2_user" {
	type = string
	default = "ubuntu"
}