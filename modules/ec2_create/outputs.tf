output "module_ec2_public_ip" {
	value = aws_instance.my-ec2-module.public_ip 
}

output "module_ec2_private_ip" {
	value = aws_instance.my-ec2-module.private_ip 
}