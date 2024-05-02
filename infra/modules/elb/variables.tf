variable "sg_id" {
    description = "sg id for ELB"
    type = string
}

variable "subnets" {
    description = "subnets for ELB"
    type = list(string)
}

variable "vpc_id" {
    description = "vpc id for ELB"
    type = string
}

variable "instances" {
    description = "instance id for taget group attachment"
    type = list(string)
}