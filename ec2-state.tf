resource "aws_ec2_instance_state" "webserver" {
    instance_id = aws_instance.web.id
    state = "running"
}

