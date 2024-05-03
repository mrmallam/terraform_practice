variable "frontend_sg_id" {
    description = "frontend sg id for EC2"
    type = string
}

variable "public_subnet_id" {
    description = "public subnet for EC2"
    type = string
}

variable "ec2_name" {
    description = "Names for EC2"
    type = string
    default = "public-Instance"
}