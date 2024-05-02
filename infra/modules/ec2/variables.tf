variable "sg_id" {
    description = "sg id for EC2"
    type = string
}

variable "subnets" {
    description = "subnets for EC2"
    type = list(string)
}

variable "ec2_names" {
    description = "Names for EC2"
    type = list(string)
    default = [ "webServer1", "webServer2" ]
}