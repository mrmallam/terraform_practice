variable "vpc_cidr" {
    description = "value of the CIDR block for the VPC"
    type        = string
}

variable "subnet_cidr" {
    description = "value of the CIDR block for the subnet"
    type        = list(string)
}

variable "subnet_names" {
    description = "value of the names for the subnet"
    type        = list(string)
    default = [ "PublicSubnet1", "PublicSubnet2" ]
}