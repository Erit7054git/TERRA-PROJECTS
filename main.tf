provider "aws" {
  region = var.region
}

# Create vpc module

module "vpc" {
  source                = "../modules/vpc"
  region                = var.region
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  
  pub_sub_az1_cidr      = var.pub_sub_az1_cidr
  pub_sub_az2_cidr      = var.pub_sub_az2_cidr

  pri_app_sub_az1_cidr  = var.pri_app_sub_az1_cidr
  pri_app_sub_az2_cidr  = var.pri_app_sub_az2_cidr
  pri_data_sub_az1_cidr = var.pri_data_sub_az1_cidr
  pri_data_sub_az2_cidr = var.pri_data_sub_az2_cidr
}
# Create nat gateways
module "nat_gateway" {
  source = "../modules/nat-gateway"
  vpc_id = module.vpc.vpc_id
  internet_gateway = module.vpc.internet_gateway

  pub_sub_az1_id = module.vpc.pub_sub_az1_id
  pub_sub_az2_id = module.vpc.pub_sub_az2_id

  pri_app_sub_az1_id = module.vpc.pri_app_sub_az1_id
  pri_app_sub_az2_id = module.vpc.pri_app_sub_az2_id
 
  pri_data_sub_az1_id = module.vpc.pri_data_sub_az1_id
  pri_data_sub_az2_id = module.vpc.pri_data_sub_az2_id
}