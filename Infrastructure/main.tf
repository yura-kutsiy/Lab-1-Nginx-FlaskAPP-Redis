provider "aws" {
  region = var.region
}
#---------------------------------------------------
data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
#---------------------------------------------------
resource "aws_instance" "nginx" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.pair_key
  security_groups             = [aws_security_group.nginx.id]
  subnet_id                   = aws_subnet.public.id
  user_data                   = file("scripts/update.sh")

  tags = merge(var.tags, { Name = "Nginx-server-${var.tags["Project"]}" })
}

resource "aws_instance" "app" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.pair_key
  security_groups             = [aws_security_group.nginx.id /*, aws_security_group.redis.id*/]
  subnet_id                   = aws_subnet.public.id
  user_data                   = file("scripts/update.sh")

  tags = merge(var.tags, { Name = "App-server-${var.tags["Project"]}" })
}

resource "aws_instance" "redis" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.pair_key
  security_groups             = [aws_security_group.nginx.id]
  subnet_id                   = aws_subnet.public.id
  user_data                   = file("scripts/update.sh")

  tags = merge(var.tags, { Name = "Redis-server-${var.tags["Project"]}" })
}

#---------------------------------------------------
