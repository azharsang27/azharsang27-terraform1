resource "aws_instance" "my-ec2-module" {
	ami = var.module_ec2_ami
	instance_type = var.module_instance_type
	key_name = var.module_key_name
	vpc_security_group_ids = ["${aws_security_group.sg.id}"]
	tags = {
	    Name = var.module_ec2_name
	}
}

resource "aws_security_group" "sg" {
	name = "sg"
	description = "Allow ssh inbound terraform"
	
	ingress {
		from_port = 22
		to_port = 22 
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		
	}
	
	ingress {
		from_port = 80
		to_port = 80 
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}