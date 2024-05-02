resource "aws_security_group" "sg" {
    name = "my_sg"
    description = "Allow HTTP and SSH inbound traffic"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow HTTP inbound traffic"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # public access
    }

    ingress {
        description = "Allow SSH inbound traffic"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # public access
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "my_sg"
    }
}