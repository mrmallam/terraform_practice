variable "backend_sg_id" {
    description = "backend sg id for EC2"
    type = string
}

variable "private_subnet_id" {
    description = "private subnet for EC2"
    type = string
}

variable "ec2_name" {
    description = "Names for EC2"
    type = string
    default = "private-Instance"
}