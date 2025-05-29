data "aws_ami" "webserver" {
    most_recent = "true"
    owners = ["amazon"]

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    filter {
      name = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-2.0.20250512.0-x86_64-gp2"]
    }

}
