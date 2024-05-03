variable "frontend_sg_id" {
    description = "frontend sg id for EC2"
    type = string
}

variable "backend_sg_id" {
    description = "backend sg id for EC2"
    type = string
}

variable "public_subnet_id" {
    description = "public subnet for EC2"
    type = string
}

variable "private_subnet_id" {
    description = "private subnet for EC2"
    type = string
}

variable "ec2_names" {
    description = "Names for EC2"
    type = list(string)
    default = [ "publicInstance", "privateInstance" ]
}