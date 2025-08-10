module "vpc" {
  source        = "../../modules/vpc"
  vpc_cidr      = "11.0.0.0/16"
  subnet_cidr   = "11.0.1.0/24"
  subnet_az     = "${var.aws_region}a"          # ap-southeast-1a
  env           = "test"
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = "ami-0e7f9c9fced6cfb10"
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.subnet_id
  ec2_count         = 2
  env               = "test"
}