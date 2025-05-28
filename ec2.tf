 resource "aws_instance" "web" {
    ami = "ami-06031e2c49c278c8f"
    instance_type = "t2.micro"
    key_name = "linux-test"
    vpc_security_group_ids = [aws_security_group.web-sg.id]
       tags = {
         Name = "Webserver"
         Env = "prod"
       }


}

resource "aws_security_group" "web-sg" {
    vpc_id = "vpc-0bcc7ee7f5a6515fc"
      tags = {
        Name = "web-sg"
        Env = "Prod"
	Resource_owner = "srinu"
        Map-migrated = "sri-sri"
      }
}

resource "aws_vpc_security_group_ingress_rule" "Allow_all" {
    security_group_id = aws_security_group.web-sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "Allow_all" {
    security_group_id = aws_security_group.web-sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}

