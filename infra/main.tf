module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
}
 
module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
}

module "ec2_frontend" {
    source            = "./modules/ec2/frontend_EC2"
    frontend_sg_id    = module.sg.frontend_sg_id
    public_subnet_id  = module.vpc.public_subnet_id
}

module "ec2_backend" {
    source            = "./modules/ec2/backend_EC2"
    backend_sg_id     = module.sg.backend_sg_id
    private_subnet_id = module.vpc.private_subnet_id
}


# module "elb" {
#     source = "./modules/elb"
#     sg_id = module.sg.sg_id
#     subnets = module.vpc.subnet_ids
#     vpc_id = module.vpc.vpc_id
#     instances = module.ec2.instances
# }