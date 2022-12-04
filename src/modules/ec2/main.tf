resource "aws_instance" "ec2" {
  count = var.ec2_should_be_created ? var.ec2_instance_count : 0

  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.ec2_key_pair.key_name

  tags = {
    Name = var.ec2_name
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_security_group_name
  }
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.ec2_ssh_key_name
  public_key = file(var.ec2_ssh_public_key_path)
}

resource "aws_ebs_volume" "ebs-vol" {
  count             = var.ec2_instance_count
  availability_zone = var.ec2_ebs_availability_zone
  size              = var.ec2_ebs_vol_size
  tags = {
    Name = var.ec2_ebs_vol_name
  }

}
#
resource "aws_volume_attachment" "ebs_attachment" {
  count        = var.ec2_instance_count
  device_name  = element(var.ec2_device_names, count.index)
  volume_id    = element(aws_ebs_volume.ebs-vol.*.id, count.index)
  instance_id  = element(aws_instance.ec2.*.id, count.index)
  force_detach = true
}
