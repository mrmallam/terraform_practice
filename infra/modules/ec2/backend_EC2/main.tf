resource "aws_instance" "backend_instance" {
    ami           = data.aws_ami.amazon-2.id
    instance_type = "t2.micro"
    associate_public_ip_address = false
    vpc_security_group_ids = [var.backend_sg_id]
    subnet_id = var.private_subnet_id
    availability_zone = data.aws_availability_zones.available.names[0]

    # user_data = <<-EOF
    #             #!/bin/bash
    #             yum update -y
    #             yum install -y httpd
    #             systemctl start httpd
    #             systemctl enable httpd
    #             echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html
    #             EOF
    tags = {
        Name = var.ec2_name
    }
} 