resource "aws_security_group" "nginx" {
  name        = "lab-1-nginx"
  description = "SG WEB"
  vpc_id      = aws_vpc.main.id
  dynamic "ingress" {
    for_each = var.ports_nginx
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "${var.tags["Project"]}-SG-Nginx" })
}

resource "aws_security_group" "redis" {
  name        = "lab-1-redis"
  description = "SG DB"
  vpc_id      = aws_vpc.main.id
  dynamic "ingress" {
    for_each = var.ports_redis
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "${var.tags["Project"]}-SG-Redis" })
}
