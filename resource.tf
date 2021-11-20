resource "aws_instance" "my-terra-ubuntu" {
	ami = "ami-0629230e074c580f2"
	instance_type = "t2.micro"
	
	tags = {
	    Name = "my-terraform-ubuntu"
	}
}