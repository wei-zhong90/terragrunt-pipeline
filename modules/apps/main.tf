resource "aws_instance" "web" {
  count                       = var.instance_count
  ami                         = data.aws_ami.linux2.id
  instance_type               = "t3.medium"
  key_name                    = aws_key_pair.deployer.id
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_volume_size # in GB 
  }

  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["${aws_security_group.ec2_allow_rule.id}"]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "apache_server_${count.index}"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "tf-admin-key"
  public_key = var.public_key
}
