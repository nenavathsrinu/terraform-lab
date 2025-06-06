resource "aws_instance" "web" {
  ami                    = data.aws_ami.webserver.id
  instance_type          = "t2.micro"
  key_name               = "linux-test"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  availability_zone      = "ap-south-1b"

  tags = {
    Name = "Webserver"
    Env  = "prod"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    echo "welcome to terraform classes" > /var/www/html/index.html
    systemctl enable httpd
    systemctl start httpd
  EOF
}

resource "aws_security_group" "web-sg" {
  vpc_id = "vpc-0bcc7ee7f5a6515fc"

  tags = {
    Name = "web-sg"
    Env  = "Prod"
  }
}

resource "aws_vpc_security_group_ingress_rule" "Allow_all" {
  security_group_id = aws_security_group.web-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "Allow_all" {
  security_group_id = aws_security_group.web-sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
